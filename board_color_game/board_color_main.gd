extends Node2D

@export_category("Multiplayer boards")
@export var number_of_simultaneous_games := 10
@export var number_of_boards_per_group := 100
@export var max_board_width := 15
@export var max_board_height := 15
@export var image_scale := 5

@export_group("Player colors")
@export var possible_colors: Array[Color]



var players : Dictionary
var observers : Dictionary # {observer_id: bool active}
var board_template = preload("res://board_color_game/board.gd")
var board_groups = []
var board_group_queue: Array[int]

var board_group_moves = []

var boards : Array[Board] = []
const number_of_players_on_board = 4

var move_counter := 0
var move_prev_time := 0
var move_time_delta := 0

var zoom := Vector2(1, 1)

class Player:
	var player_name : String
	var active : bool
	var player_label : RichTextLabel = null # Potentially remove?
	var disconnect_time : int = 0
	var observers : Array[int] # A list of all observers
	var board_group : int

	func _init(player_name: String):
		self.player_name = player_name
		self.active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	GameServer.peer_connected.connect(_player_connected)
	GameServer.peer_disconnected.connect(_player_disconnected)
	GameServer.peer_reconnected.connect(_player_reconnected)
	GameServer.peer_message_received.connect(_receive_message)
	GameServer.start()
	
	#var b = await _generate_boards()
	#var b = board_template.new()
	#await b.generate_random_board(18, 5)
	#b.setup_players(players_test)
	#_show_board(b)
	#print(b.get_obstacle_serialized())
	

var players_test = {10: Color.CADET_BLUE, 11: Color.CHARTREUSE, 12: Color.YELLOW_GREEN, 13: Color.WEB_MAROON}

# This is for testing
var current_board = 0
func _after_ready():
	var gen_start_time = Time.get_ticks_msec()
	$Sprite2D.set_texture(ImageTexture.create_from_image(boards[current_board].get_scaled_image(20)))
	#print("Time to scale image: ", Time.get_ticks_msec() - gen_start_time, " ms")

func _show_board(board_group: int, board_index: int):
	$BoardViewer.update_board(board_groups[board_index].get_scaled_image(image_scale), board_index)
	#$Sprite2D.set_texture(ImageTexture.create_from_image(board.get_scaled_image(25)))

# This is for testing
var next_moves = {10: "R", 12: "L", 11: "R", 13: "L"}
var valid_moves = ["R", "L", "U", "D"]
func _unhandled_input(event):
	#if event.is_action_pressed("ui_accept"):
		#for player_id in next_moves:
			#next_moves[player_id] = valid_moves.pick_random()
		#for board in boards:
			#board.take_moves(next_moves)
		##boards[current_board].take_moves(next_moves)
		#_after_ready()
	#elif event.is_action_pressed("W"):
		#next_moves[10] = "U"
	#elif event.is_action_pressed("A"):
		#next_moves[10] = "L"
	#elif event.is_action_pressed("S"):
		#next_moves[10] = "D"
	#elif event.is_action_pressed("D"):
		#next_moves[10] = "R"
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("CameraPan"):
			$Camera.position -= (event.relative / zoom)
		
	if event.is_action_pressed("CameraZoomIn"):
		zoom += Vector2(0.05, 0.05)
		zoom = zoom.clamp(Vector2(0.1, 0.1), Vector2(5, 5))
		$Camera.set_zoom(zoom)
		
	if event.is_action_pressed("CameraZoomOut"):
		zoom -= Vector2(0.05, 0.05)
		zoom = zoom.clamp(Vector2(0.1, 0.1), Vector2(5, 5))
		$Camera.set_zoom(zoom)
		
	if len(board_groups) > 0:
		if event.is_action_pressed("D"):
			game_board_index = (game_board_index + 1) % len(board_groups[board_group_index])
		if event.is_action_pressed("S"):
			board_group_index = (board_group_index + 1) % len(board_groups)
		#_show_board(board_group_index, game_board_index)

var board_group_index = 0

func _player_connected(player_id: int, player_name: String):
	if player_name == "observer":
		#observers.append(player_id)
		print("Observer connected. Don't really do anything")
		return
	print("Player connected: %s %s" % [player_id, player_name])
	players[player_id] = Player.new(player_name)
	var new_label : RichTextLabel = $PlayerListGrid/PlayerRichLabelTemplate.duplicate(0)
	new_label.set_text(players[player_id].player_name)
	new_label.show()
	$PlayerListGrid.add_child(new_label)
	players[player_id].player_label = new_label
	
	send_message(player_id, "Welcome to the Game!")
	board_group_queue.append(player_id)
	print(board_group_queue)
	if board_group_queue.size() == number_of_players_on_board:
		start_game(board_group_queue.duplicate()) # concurrency might be an issue?
		board_group_queue.clear()
	
	

func _player_disconnected(player_id: int):
	#players[player_id].player_label.hide()
	players[player_id].player_label.clear()
	players[player_id].player_label.push_color(Color.RED)
	players[player_id].player_label.add_text(players[player_id].player_name)
	players[player_id].active = false
	players[player_id].disconnect_time = Time.get_ticks_msec()

# TODO Check if the player is playing any games, send the boards, positions and current status
func _player_reconnected(player_id: int):
	players[player_id].player_label.clear()
	players[player_id].player_label.add_text(players[player_id].player_name)
	players[player_id].active = true
	GameServer.send_string(player_id, "Welcome back %s" % [players[player_id].player_name])


func _receive_message(id, message):
	if id in players:
		_receive_player_message(id, message)
	elif id in observers:
		_receive_observer_message(id, message)

func _receive_observer_message(observer_id, message):
	pass
	
func _receive_player_message(player_id, message):
	print("Received message from %s: %s" % [player_id, message])
	print("	Part of group: %s" % players[player_id].board_group)
	
	var board_group_id = players[player_id].board_group
	if len(board_groups[board_group_id]) == len(message): # TODO what the hell is this?
		board_group_moves[players[player_id].board_group][player_id] = message
		if len(board_group_moves[players[player_id].board_group]) == 4:
			moves_received(players[player_id].board_group)
		
	
	

func send_message(id, message):
	GameServer.send_string(id, message)


func moves_received(board_group_id: int):
	var players_in_group : Array[int]
	for player_id in board_group_moves[board_group_id]:
		players_in_group.append(player_id)
	
	var updated_player_positions : PackedByteArray = []
	for board_i: int in range(len(board_groups[board_group_id])):
		print(board_i, board_group_id)
		var player_dict = board_group_moves[board_group_id].duplicate()
		for player_id in board_group_moves[board_group_id]:
			player_dict[player_id] = board_group_moves[board_group_id][player_id][board_i]
		
		board_groups[board_group_id][board_i].take_moves(player_dict)
		$BoardViewer.update_board(board_groups[board_group_id][board_i].get_scaled_image(image_scale), board_i)
		updated_player_positions += board_groups[board_group_id][board_i].get_serialized_player_number_positions()
	#_show_board(board_groups[0][0])
	#print(updated_player_positions)
	GameServer.send_data_to_group(players_in_group, updated_player_positions, true)
	GameServer.send_string_to_group(players_in_group, "SEND_MOVES")
	board_group_moves[board_group_id].clear()
	
	move_counter += 1
	var move_delta_string = "0"
	var move_time_delta_average = 0
	if move_prev_time != 0:
		move_time_delta = Time.get_ticks_msec() - move_prev_time
		move_time_delta_average = move_time_delta
	move_prev_time = Time.get_ticks_msec()
	$MoveCounter.set_text("Moves: " + str(move_counter) + " - " + str(move_time_delta_average))
	

## Starts a game using the ids in [param players_list]. [br]
var game_board_index = 0
func start_game(players_list: Array[int]):
	var game_boards := await _generate_boards(number_of_boards_per_group)
	var player_setup: Dictionary
	
	for i in range(players_list.size()):
		player_setup[players_list[i]] = possible_colors[i]
	print("Player setup: ", player_setup)
	
	var serialized_boards : Array[PackedByteArray]
	var number_of_bytes := 4 # Number of boards, 4 bytes
	for game_board in game_boards:
		game_board.setup_players(player_setup)
		var serialized_board = game_board.get_obstacle_serialized()
		var game_board_width_bytes : int = game_board.get_width()
		var game_board_height_bytes : int = game_board.get_height() 
		
		var serialized_with_prelude : PackedByteArray
		print("Game board width bytes ", game_board_width_bytes >> 8)
		serialized_with_prelude.append(game_board_width_bytes >> 8)
		serialized_with_prelude.append(game_board_width_bytes & 0xff)
		serialized_with_prelude.append(game_board_height_bytes >> 8)
		serialized_with_prelude.append(game_board_height_bytes & 0xff)
		serialized_with_prelude += serialized_board
		
		number_of_bytes += serialized_with_prelude.size()
		
		serialized_boards.append(serialized_with_prelude)
	
	print(number_of_bytes)
	var final_message : PackedByteArray
	for x in range(4):
		final_message.append((number_of_bytes >> (24 - x * 8)) & 0xff)
	
	for x in range(4):
		final_message.append((number_of_boards_per_group >> (24 - x * 8)) & 0xff)
	
	for serialized_board in serialized_boards:
		final_message += serialized_board
	print(final_message)
	var error = GameServer.send_string_to_group(players_list, "GAME_STARTING")
	if error != OK:
		print("Failed to send GAME_STARTING")
	
	GameServer.send_data_to_group(players_list, final_message)
	
	# Send player numbers to each member
	var player_positions_data : PackedByteArray
	for board in game_boards:
		player_positions_data += board.get_serialized_player_number_positions()
	print(player_positions_data)
	
	var player_position_num_of_bytes = player_positions_data.size()
	var player_positions_message : PackedByteArray
	for x in range(4):
		player_positions_message.append((player_position_num_of_bytes >> (24 - x * 8)) & 0xff)
	
	player_positions_message += player_positions_data
	GameServer.send_data_to_group(players_list, player_positions_message)
	
	var player_number = 1
	for player in players_list:
		var message : PackedByteArray = [0, 0, 0, 1, player_number]
		player_number += 1
		GameServer.send_data(player, message) 
	
	board_groups.append(game_boards)
	
	# Send moves
	var group_moves : Dictionary
	for player in players_list:
		players[player].board_group = len(board_groups)-1
	board_group_moves.append(group_moves)
	
	GameServer.send_string_to_group(players_list, "SETUP_COMPLETE_SEND_MOVES")
	# Development purposes
	for board in game_boards:
		$BoardViewer.add_board(board.get_scaled_image(image_scale))
	#_show_board(game_boards[game_board_index])




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	pass
	
func _generate_boards(number_of_boards: int = 1) -> Array[Board]:
	var local_boards: Array[Board]
	for x in range(number_of_boards):
		var size = 0
		var board: Board = board_template.new()
		var width = 5 + randi() % max_board_width
		var height = 5 + randi() % max_board_height
		
		await board.generate_random_board(width, height)
		local_boards.append(board)
	return local_boards




# This is testing stuff
var rounds = 50
var current_round = 0
func _on_game_tick_timeout():
	if current_round < rounds:
		for player_id in next_moves:
			next_moves[player_id] = valid_moves.pick_random()
		for board in boards:
			board.take_moves(next_moves)
		_after_ready()
	else:
		boards[current_board].history_playback_setup()
		$GameTick.stop()
		$HistoryTick.start()
	current_round += 1


func _on_history_tick_timeout():
	if boards[current_board].history_playback_step():
		$HistoryTick.stop()
	#print(boards[current_board].count_colors())
	_after_ready()
