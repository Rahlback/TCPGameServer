extends Node2D

@export_category("Board setup")
@export var number_of_simultaneous_games := 10
@export var number_of_boards_per_group := 100
@export_group("Board size")
@export var min_board_width := 5
@export var min_board_height := 5
@export var max_board_width := 15
@export var max_board_height := 15
@export var image_scale := 5

@export_group("Game rules")
@export var moves_until_game_over := 500

@export_group("Player colors")
@export var possible_colors: Array[Color]

@export_group("Debug")

## Deprecated. Displays all boards being played
@export var show_boards := false 


var players : Dictionary
var observers : Dictionary # {observer_id: bool active}
#var board_template = preload("res://board_color_game/board/board.gd")
const BOARD = preload("res://board_color_game/board/board.tscn")
const BOARD_VIEW_GROUP = preload("res://board_color_game/board/board_view_group.tscn")

var board_groups : Dictionary
var board_group_queue: Array[int]
var board_group_moves : Dictionary
var board_group_id_latest = -1
#var boards : Array[Board] = []
const number_of_players_on_board = 4

var move_counter := 0.0
var move_prev_time := 0
var move_time_delta := 0
var time_start := 0

var zoom := Vector2(1, 1)

# Onready items
@onready var side_bar = $UI/SideBar
@onready var move_counter_ui = $UI/MoveCounter
@onready var board_holder = $BoardHolder
@onready var board_queue_timer = $BoardQueueTimer


# debug
var lost_moves = 0 

class Player:
	var player_name : String
	var active : bool
	var disconnect_time : int = 0
	var observers : Array[int] # A list of all observers
	var board_group : int = -1
	
	var score = 0

	func _init(player_name_inp: String):
		self.player_name = player_name_inp
		self.active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	GameServer.peer_connected.connect(_player_connected)
	GameServer.peer_disconnected.connect(_player_disconnected)
	GameServer.peer_reconnected.connect(_player_reconnected)
	GameServer.peer_message_received.connect(_receive_message)
	if GameServer.start() != 0:
		print("Failed to start game server")
	
	# Fix bug when camera zoom is set in editor
	# TODO: The zoom level should be moved to the camera.
	zoom = $Camera.get_zoom()
	Performance.add_custom_monitor("Connected players", _get_num_of_connected_players)

func _get_num_of_connected_players():
	var num_of_active_players := 0
	for player in players:
		if players[player].active:
			num_of_active_players += 1
	return num_of_active_players

var players_test = {10: Color.CADET_BLUE, 11: Color.CHARTREUSE, 12: Color.YELLOW_GREEN, 13: Color.WEB_MAROON}

# This is for testing
#var current_board = 0
#func _after_ready():
	#var gen_start_time = Time.get_ticks_msec()
	#$Sprite2D.set_texture(ImageTexture.create_from_image(boards[current_board].get_scaled_image(20)))
	##print("Time to scale image: ", Time.get_ticks_msec() - gen_start_time, " ms")
#
#func _show_board(board_group: int, board_index: int):
	#$BoardViewer.update_board(board_groups[board_index].get_scaled_image(image_scale), board_index)
	##$Sprite2D.set_texture(ImageTexture.create_from_image(board.get_scaled_image(25)))

# This is for testing
var next_moves = {10: "R", 12: "L", 11: "R", 13: "L"}
var valid_moves = ["R", "L", "U", "D"]

func _unhandled_input(event):
	# TODO: The zoom functionality should be moved to the camera node
	if event.is_action_pressed("CameraZoomIn"):
		zoom += Vector2(0.05, 0.05)
		zoom = zoom.clamp(Vector2(0.1, 0.1), Vector2(5, 5))
		$Camera.set_zoom(zoom)
		
	if event.is_action_pressed("CameraZoomOut"):
		zoom -= Vector2(0.05, 0.05)
		zoom = zoom.clamp(Vector2(0.1, 0.1), Vector2(5, 5))
		$Camera.set_zoom(zoom)

func _input(event):
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("CameraPan"):
			$Camera.position -= (event.relative / zoom)

func _player_connected(player_id: int, player_name: String):
	if player_name == "observer":
		#observers.append(player_id)
		print("Observer connected. Don't really do anything")
		return
	print_debug("Player connected: %s %s" % [player_id, player_name])
	players[player_id] = Player.new(player_name)
	side_bar.add_player(players[player_id].player_name, player_id)
	
	send_message(player_id, "Welcome to the Game!")
	add_player_to_queue(player_id)
	
func add_player_to_queue(player_id: int):
	board_group_queue.append(player_id)
	print(board_group_queue)

func _start_game_with_check():
	# TODO Fix hard coded 4. It should be replaced with the number of players
	# on a board. 
	while len(board_group_queue) >= 4:
		var new_group = board_group_queue.slice(0, 4)
		if new_group.size() == 4:
			var board_players_still_active = true
			for id in new_group:
				if not players[id].active:
					board_players_still_active = false
					board_group_queue.erase(id)
			
			if board_players_still_active:
				start_game(new_group.duplicate()) # concurrency might be an issue?
				# TODO Is there a better way to do this?
				for id in new_group:
					board_group_queue.erase(id)

func _player_disconnected(player_id: int):
	#players[player_id].player_label.hide()
	if player_id in board_group_queue:
		board_group_queue.erase(player_id)

	players[player_id].active = false
	players[player_id].disconnect_time = Time.get_ticks_msec()
	side_bar.player_offline(player_id)

	if players[player_id].board_group >= 0: # In case this player wasn't part of a group
		game_over(players[player_id].board_group)


# TODO Check if the player is playing any games, send the boards, positions and current status
func _player_reconnected(player_id: int):
	side_bar.player_online(player_id)
	players[player_id].active = true
	GameServer.send_string(player_id, "Welcome back %s" % [players[player_id].player_name])
	add_player_to_queue(player_id)


func _receive_message(id, message):
	if id in players:
		_receive_player_message(id, message)
	elif id in observers:
		_receive_observer_message(id, message)

func _receive_observer_message(_observer_id, _message):
	pass

func _receive_player_message(player_id, message):
	#print("Received message from %s: %s. len=%s" % [player_id, message, len(message)])
	#print("Received message from %s: len=%s" % [player_id, len(message)])
	#print("	Part of group: %s" % players[player_id].board_group)
	if players[player_id].active == false:
		print_debug("Player is inactive, but sent a message!: ", player_id)
	var board_group_id = players[player_id].board_group
	
	if board_group_id < 0:
		print_debug("	Message received too early. ", board_group_id)
		return
	# If number of boards is the same as the message
	if len(board_groups[board_group_id]) == len(message):
		board_group_moves[players[player_id].board_group][player_id] = message
		if len(board_group_moves[players[player_id].board_group]) == 4:
			moves_received(players[player_id].board_group)
	else:
		lost_moves += 1
		print_rich("Lost move from [color=black]" + str(player_id) + ". Message = [color=red]" + message)
		$LostMoves.set_text("Lost moves: " + str(lost_moves))
		GameServer.send_string(player_id, "RESEND_MOVE")
	
	

func send_message(id, message):
	GameServer.send_string(id, message)


func moves_received(board_group_id: int):
	var players_in_group : Array[int] = []
	for player_id in board_group_moves[board_group_id]:
		players_in_group.append(player_id)
	
	var updated_player_positions : PackedByteArray = []
	for board_i: int in range(len(board_groups[board_group_id])):
		#print(board_i, board_group_id)
		var player_dict = board_group_moves[board_group_id].duplicate()
		for player_id in board_group_moves[board_group_id]:
			player_dict[player_id] = board_group_moves[board_group_id][player_id][board_i]
		
		board_groups[board_group_id][board_i].take_moves(player_dict)
		#if show_boards:
			#$BoardViewer.update_board(board_groups[board_group_id][board_i].get_scaled_image(image_scale), board_group_id, board_i)
		updated_player_positions += board_groups[board_group_id][board_i].get_serialized_player_number_positions()
	#_show_board(board_groups[0][0])
	#print(updated_player_positions)
	
	move_counter += (1.0 / len(board_groups))
	#var move_delta_string = "0"
	#var move_time_delta_average = 0
	if move_prev_time != 0:
		move_time_delta = Time.get_ticks_msec() - move_prev_time
		#move_time_delta_average = move_time_delta
	move_prev_time = Time.get_ticks_msec()
	move_counter_ui.set_text("Moves: " + str(round(move_counter)) + 
							 " - " + str(round((move_prev_time - time_start) / move_counter)) 
							 + " ms/frame")
	
	if board_groups[board_group_id][0].get_number_of_moves() >= moves_until_game_over:
		game_over(board_group_id)
	else:
		GameServer.send_data_to_group(players_in_group, updated_player_positions, true)
		#GameServer.send_string_to_group(players_in_group, "SEND_MOVES")
	
	board_group_moves[board_group_id].clear()
	
	

## Starts a game using the ids in [param players_list]. [br]
func start_game(players_list: Array[int]):
	var game_boards := await _generate_boards(number_of_boards_per_group)
	var player_setup: Dictionary = {}
	
	for i in range(players_list.size()):
		player_setup[players_list[i]] = possible_colors[i]
		side_bar.update_player_color(players_list[i], possible_colors[i])
	print("Player setup: ", player_setup)
	
	var serialized_boards : Array[PackedByteArray] = []
	var number_of_bytes := 4 # Number of boards, 4 bytes
	for game_board in game_boards:
		game_board.setup_players(player_setup)
		var serialized_board = game_board.get_obstacle_serialized()
		var game_board_width_bytes : int = game_board.get_width()
		var game_board_height_bytes : int = game_board.get_height() 
		
		var serialized_with_prelude : PackedByteArray = []
		#print("Game board width bytes ", ceil(game_board_width_bytes / 8.0))
		serialized_with_prelude.append(game_board_width_bytes >> 8)
		serialized_with_prelude.append(game_board_width_bytes & 0xff)
		serialized_with_prelude.append(game_board_height_bytes >> 8)
		serialized_with_prelude.append(game_board_height_bytes & 0xff)
		serialized_with_prelude += serialized_board
		
		number_of_bytes += serialized_with_prelude.size()
		
		serialized_boards.append(serialized_with_prelude)
	
	print(number_of_bytes)
	var final_message : PackedByteArray = []
	for x in range(4):
		final_message.append((number_of_bytes >> (24 - x * 8)) & 0xff)
	
	for x in range(4):
		final_message.append((number_of_boards_per_group >> (24 - x * 8)) & 0xff)
	
	for serialized_board in serialized_boards:
		final_message += serialized_board
	print(final_message)
	var error = GameServer.send_string_to_group(players_list, "GAME_STARTING")
	if error != OK:
		print("Failed to send GAME_STARTING. Abort this game setup: ", players_list)
		for board in game_boards:
			board.queue_free()
		return
		
	
	GameServer.send_data_to_group(players_list, final_message)
	
	# Send player numbers to each member
	var player_positions_data : PackedByteArray = []
	for board in game_boards:
		player_positions_data += board.get_serialized_player_number_positions()
	print(player_positions_data)
	
	var player_position_num_of_bytes = player_positions_data.size()
	var player_positions_message : PackedByteArray = []
	for x in range(4):
		player_positions_message.append((player_position_num_of_bytes >> (24 - x * 8)) & 0xff)
	
	player_positions_message += player_positions_data
	GameServer.send_data_to_group(players_list, player_positions_message)
	
	var player_number = 1
	for player in players_list:
		var message : PackedByteArray = [0, 0, 0, 1, player_number]
		player_number += 1
		GameServer.send_data(player, message) 
	
	var next_board_group_id = board_group_id_latest + 1
	board_group_id_latest = next_board_group_id
	board_groups[next_board_group_id] = game_boards
	#board_groups.append(game_boards)
	
	# Send moves
	var group_moves : Dictionary = {}
	for player in players_list:
		players[player].board_group = next_board_group_id
	board_group_moves[next_board_group_id] = group_moves
	#board_group_moves.append(group_moves)
	
	GameServer.send_string_to_group(players_list, "SETUP_COMPLETE_SEND_MOVES")
	# Development purposes
	if show_boards:
		for board in game_boards:
			$BoardViewer.add_board(board.get_scaled_image(image_scale), len(board_groups)-1)
	time_start = Time.get_ticks_msec()

func game_over(board_group_id: int):
	# TODO: Gather statistics and add to the players
	# TODO: 
	if len(board_groups[board_group_id]) == 0 or not board_groups[board_group_id][0]:
		return
		
	for player_id in board_groups[board_group_id][0].player_colors:
		if players[player_id].active:
			GameServer.send_string(player_id, "GAME_OVER")
			
			add_player_to_queue(player_id)
	
	for board: Node in board_groups[board_group_id]:
		board.queue_free()
	board_groups[board_group_id].clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	##print(board_groups[0][0].count_colors())
	#pass
	#
#func _physics_process(delta):
	#pass
	
func _generate_boards(number_of_boards: int = 1) -> Array[Node2D]:
	var local_boards: Array[Node2D] = []
	var new_board_group := BOARD_VIEW_GROUP.instantiate()
	board_holder.add_child(new_board_group)
	for x in range(number_of_boards):
		var board = BOARD.instantiate()
		var width = max(min_board_width, randi() % max_board_width)
		var height = max(min_board_height, randi() % max_board_height)
		
		await board.generate_random_board(width, height)
		local_boards.append(board)

		new_board_group.add_board(board)
	
	if board_holder.get_child_count() > 1:
		var prev_board_pos = board_holder.get_children().back().position
		new_board_group.position = prev_board_pos + new_board_group.get_size()
		board_holder.arrange_children()
		
	
	return local_boards




# This is testing stuff
#var rounds = 50
#var current_round = 0
#func _on_game_tick_timeout():
	#if current_round < rounds:
		#for player_id in next_moves:
			#next_moves[player_id] = valid_moves.pick_random()
		#for board in boards:
			#board.take_moves(next_moves)
		#_after_ready()
	#else:
		#boards[current_board].history_playback_setup()
		#$GameTick.stop()
		#$HistoryTick.start()
	#current_round += 1
#
#
#func _on_history_tick_timeout():
	#if boards[current_board].history_playback_step():
		#$HistoryTick.stop()
	##print(boards[current_board].count_colors())
	#_after_ready()
