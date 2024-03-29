## This is a helper class for game_server. It was originally meant to be an 
## inner class, but there was something wrong with the doc generation
class_name Peer

var tcp_stream : StreamPeerTCP ## TCP client connection
var user_id : int ## User id. Nothing special. Most likely randomly generated
var user_name : String = "" ## User name. To be provided by the client
var time_of_connection : int
var last_message_time : int = 0

static func _create_peer(tcp_stream: StreamPeerTCP, user_id: int, user_name: String, time_of_connection: int) -> Peer:
	var new_peer = Peer.new()
	new_peer.tcp_stream = tcp_stream
	new_peer.user_id = user_id
	new_peer.user_name = user_name
	new_peer.time_of_connection = time_of_connection
	return new_peer
