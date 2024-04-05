## This autoloaded script handles the TCP server and connection logic. [br]
## When a client tries to connect, they will be temporarily accepted whilst
## answering a question about user_id and name. There can be multiple clients
## with the same name. User IDs are unique. If a client requests a user id
## that is already occupied, the connection will be refused.

extends Node

@export_range(444, 65535) var PORT := 9080 ## TCP server port
@export var max_connections := 100 ## Max number of clients that can be connected at once
@export_range(500, 10000, 50) var heartbeat_timer_ms := 1000
var current_connections := 0

var used_user_ids = []

var server := TCPServer.new() ## TCP server which will be running

## A dictionary containing all peers currently connected.
## Will be of the format { peer_id: [Peer] }
var peers: Dictionary 

## Peers that have connected, but not registered themselves yet. 
## In order to register, we need a message specifying at least a name,
## and perhaps a user_id as well. [br]
## If the user_id exists in the [member disconnected_peers], assign this peer
## that user_id and move it to [member peers]. 
## If no user_id is provided, assign a random user_id
var non_registered_peers: Array[StreamPeerTCP]

## Pending TCP client connections. Once the initial TCP handshake
## is complete, the client will be moved over to [member non_registered_peers]
var pending_peers: Array[StreamPeerTCP] = []

## A dictionary containing the IDs of disconnected peers { peer_id: [Peer] }
var disconnected_peers: Dictionary 

signal peer_connected(id, user_name) ## Emitted when a client connects
signal peer_disconnected(id) ## Emitted when a client disconnects
signal peer_reconnected(id) ## Emitted when a client reconnects
signal peer_message_received(id, message)


func _ready():
	pass

## Start the TCP server
func start():
	var result = server.listen(PORT)
	return result

## Sends a message as a string in ASCII. [br]
## [param dict] can be changed to another dictionary, depending on which
## dictionary should be used, [member peers] or [member pending_peers]
func send_string(id: int, message: String, target_dict = peers):
	print("Send string to: ", id, ", message = ", message)
	if id == 0:
		for peer: Peer in target_dict:
			peer.last_message_time = Time.get_ticks_msec()
			peer.tcp_stream.put_string(message)
	elif id in target_dict:
		target_dict[id].tcp_stream.put_string(message)

func send_string_to_group(ids: Array[int], message):
	var result = OK
	for id in ids:
		if id in peers:
			peers[id].last_message_time = Time.get_ticks_msec()
			peers[id].tcp_stream.put_string(message)
		else:
			print_debug("Id: ", id, " not in peers")
			result = FAILED
	return result

func send_data_to_group(ids: Array[int], data: PackedByteArray, add_prelude := false):
	#print("Send data to group")
	if add_prelude:
		var length_of_data = len(data)
		var prelude : PackedByteArray
		for x in range(4):
			prelude.append((length_of_data >> (24 - x * 8)) & 0xff)
		
		data = prelude + data
	
	var result = OK
	for id in ids:
		if id in peers:
			peers[id].last_message_time = Time.get_ticks_msec()
			peers[id].tcp_stream.put_data(data)
		else:
			print_debug("Id: ", id, " not in peers")
			result = FAILED
	return result

func receive_message(peer: Peer):
	peer.last_message_time = Time.get_ticks_msec()
	var available_data = peer.tcp_stream.get_available_bytes()
	#print("Available data: ", available_data)
	var message = peer.tcp_stream.get_string(available_data)
	#print("	Receive message: ", peer.user_id, " message= ", message)
	#if message == "":
		#print("	Something went wrong with the packet from ", peer.user_id, ". Abort")
		#return
	peer_message_received.emit(peer.user_id, message)

func send_data(id: int, data: PackedByteArray):
	#print("Sending data")
	return send_data_to_group([id], data)

## Checks if a pending peer has established a connection. If it has, add it to 
## [member non_registered_peers].
## [br] If the connection fails, remove the connection.
## [br] Returns true if this pending_peer is done processing.
## [br] When the peer is successfully connected, send a message asking for 
## user id and name.
func _connect_pending_peer(pending_peer: StreamPeerTCP) -> bool:
	pending_peer.poll()
	match pending_peer.get_status():
		StreamPeerTCP.STATUS_CONNECTING:
			return false
		StreamPeerTCP.STATUS_CONNECTED:
			non_registered_peers.append(pending_peer)
			print("Adding peer to non_registered_peers")
			return true
		_:
			pending_peer.disconnect_from_host()
			return true

## Check if a peer is still connected
func _peer_still_connected(peer: StreamPeerTCP) -> bool:
	peer.poll()
	return peer.get_status() == StreamPeerTCP.STATUS_CONNECTED

## Finish up registring peer
func _complete_register_peer(peer: Peer) -> bool:
	if peer.user_id in peers:
		return false
	elif peer.user_id in disconnected_peers:
		peers[peer.user_id] = peer
		disconnected_peers.erase(peer.user_id)
		peer_reconnected.emit(peer.user_id)
		print("Peer has reconnected")
	else:
		peers[peer.user_id] = peer
		peer_connected.emit(peer.user_id, peer.user_name)
	return true

## Attempt to register a recently connected peer.
## [br] Checks if the peer has sent a "REGISTER:user_id=XXX,name=YYY,big_endian=Z"
## message.
func _register_peer(peer: StreamPeerTCP):
	#print("Checking if peer has registered")
	var message_buffer : PackedByteArray = []
	while peer.get_available_bytes() > 0:
		#print(peer.get_available_bytes())
		var message = peer.get_partial_data(100)
		message_buffer += message[1]
	
	if message_buffer:
		var message = message_buffer.get_string_from_ascii()
		print("Message: ", message)
		if not "user_id" in message:
			print("Missing user_id. Reject connection")
			return
		if not "name" in message:
			print("Missing name. Reject connection")
			return
		if not "big_endian" in message:
			print("Missing big_endian. Reject connection")
			return
		
		var regex = RegEx.new()
		regex.compile("\\d+")
		var user_id_ss = regex.search(message, message.find("user_id=") + 8)
		if not user_id_ss:
			return
		var user_id = user_id_ss.get_string() as int
		print("User id: ", user_id, " X")
		
		regex.compile("(\\d|-|\\w+)+")
		var user_name = regex.search(message, message.find("name=") + 4)
		if not user_name:
			return

		regex.compile(".")
		var big_endian = regex.search(message, message.find("big_endian=") + 11)
		if not big_endian:
			big_endian = 1
		peer.set_big_endian(big_endian.get_string() as int as bool)
		
		var new_peer := Peer._create_peer(peer, user_id, user_name.get_string(), Time.get_ticks_msec())
		if not _complete_register_peer(new_peer):
			new_peer.tcp_stream.put_string("NOK")
		else:
			new_peer.tcp_stream.put_string("OK") # TODO: Maybe we don't need this
		return true

	return false

func _process(_delta):
	## Check if there are any new connections available. 
	while current_connections <= max_connections and server.is_connection_available():
		var new_client: StreamPeerTCP = server.take_connection()
		pending_peers.append(new_client)
		
	var pending_peers_to_remove = []
	for pending_peer: StreamPeerTCP in pending_peers:
		if _connect_pending_peer(pending_peer):
			print("Peer connected successfully")
			pending_peers_to_remove.append(pending_peer)
	for pending_peer in pending_peers_to_remove:
		pending_peers.erase(pending_peer)
	
	var newly_registered_peers = []
	for peer in non_registered_peers:
		if _register_peer(peer):
			newly_registered_peers.append(peer)
	for peer in newly_registered_peers:
		non_registered_peers.erase(peer)
	
	var peers_to_remove = []
	for peer_id in peers:
		# Check state of connection
		#print("Peer status: ", peers[peer_id].tcp_stream.get_status())
		peers[peer_id].tcp_stream.poll()
		#print("Peer: ", peer_id, " - ", peers[peer_id].tcp_stream.get_available_bytes())
		if peers[peer_id].tcp_stream.get_status() != StreamPeerTCP.STATUS_CONNECTED:
			peers_to_remove.append(peer_id)
			print("Peer has disconnected")
		elif peers[peer_id].tcp_stream.get_available_bytes() > 0:
			#print("Peer has a message!")
			receive_message(peers[peer_id])

	
	for peer_id in peers_to_remove:
		disconnected_peers[peer_id] = peers[peer_id]
		#print("Trying to erase peer_id ", peer_id, " from peers")
		peer_disconnected.emit(peer_id)
		peers.erase(peer_id)
	
	#if print_counter == print_interval:
		#print("peers: ", peers)
		#print("\tdisconnected peers: ", disconnected_peers)
		#print_counter = 0
	#
	#print_counter += 1


func _on_heart_beat_timer_timeout():
	var current_time = Time.get_ticks_msec()
	for peer in peers:
		if current_time - peers[peer].last_message_time > heartbeat_timer_ms:
			send_string(peer, "HEARTBEAT")
