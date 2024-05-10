## This is a helper class for game_server. It was originally meant to be an 
## inner class, but there was something wrong with the doc generation
class_name Peer

var tcp_stream : StreamPeerTCP ## TCP client connection
var user_id : int ## User id. Nothing special. Most likely randomly generated
var user_name : String = "" ## User name. To be provided by the client
var time_of_connection : int
var last_message_time : int = 0

static func _create_peer(tcp_stream_inp: StreamPeerTCP, user_id_inp: int, user_name_inp: String, time_of_connection_inp: int) -> Peer:
	var new_peer = Peer.new()
	new_peer.tcp_stream = tcp_stream_inp
	new_peer.user_id = user_id_inp
	new_peer.user_name = user_name_inp
	new_peer.time_of_connection = time_of_connection_inp
	return new_peer
