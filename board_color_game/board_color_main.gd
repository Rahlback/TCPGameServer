extends Node2D

@export var number_of_simultaneous_games := 10
@export var number_of_boards_per_group := 100

var players : Dictionary
var observers : Array[int] # An array of ids that the server can use to send data
var board_template = preload("res://board_color_game/board.gd")
var board_groups = []
var board_group_queue = []
var boards : Array[Board] = []


class Player:
	var player_name : String
	var active : bool
	var player_label : RichTextLabel = null # Potentially remove?
	var disconnect_time : int = 0

	func _init(player_name: String):
		self.player_name = player_name
		self.active = true


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	GameServer.peer_connected.connect(_player_connected)
	GameServer.peer_disconnected.connect(_player_disconnected)
	GameServer.peer_reconnected.connect(_player_reconnected)
	GameServer.start()
	var gen_start_time = Time.get_ticks_msec()
	for x in range(0, 1000):
		var board: Board = board_template.new()
		await board.generate_random_board(5 + randi() % 15, 5 + randi() % 15)
		boards.append(board)
	print("Time to generate boards: ", Time.get_ticks_msec() - gen_start_time, " ms")
	for board in boards:
		board.setup_players(players_test)
	_after_ready()

var players_test = {10: Color.CADET_BLUE, 11: Color.CHARTREUSE, 12: Color.YELLOW_GREEN, 13: Color.WEB_MAROON}

# This is for testing
var current_board = 0
func _after_ready():
	var gen_start_time = Time.get_ticks_msec()
	$Sprite2D.set_texture(ImageTexture.create_from_image(boards[current_board].get_scaled_image(20)))
	#print("Time to scale image: ", Time.get_ticks_msec() - gen_start_time, " ms")

# This is for testing
var next_moves = {10: "R", 12: "L", 11: "R", 13: "L"}
var valid_moves = ["R", "L", "U", "D"]
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		for player_id in next_moves:
			next_moves[player_id] = valid_moves.pick_random()
		for board in boards:
			board.take_moves(next_moves)
		#boards[current_board].take_moves(next_moves)
		_after_ready()
	elif event.is_action_pressed("W"):
		next_moves[10] = "U"
	elif event.is_action_pressed("A"):
		next_moves[10] = "L"
	elif event.is_action_pressed("S"):
		next_moves[10] = "D"
	elif event.is_action_pressed("D"):
		next_moves[10] = "R"

func _player_connected(player_id: int, player_name: String):
	if player_name == "observer":
		observers.append(player_id)
		print("Observer connected")
		return
	print("Player connected: %s %s" % [player_id, player_name])
	players[player_id] = Player.new(player_name)
	var new_label : RichTextLabel = $PlayerListGrid/PlayerRichLabelTemplate.duplicate(0)
	new_label.set_text(players[player_id].player_name)
	new_label.show()
	$PlayerListGrid.add_child(new_label)
	players[player_id].player_label = new_label
	

func _player_disconnected(player_id: int):
	#players[player_id].player_label.hide()
	players[player_id].player_label.clear()
	players[player_id].player_label.push_color(Color.RED)
	players[player_id].player_label.add_text(players[player_id].player_name)
	players[player_id].active = false
	players[player_id].disconnect_time = Time.get_ticks_msec()

func _player_reconnected(player_id: int):
	players[player_id].player_label.clear()
	players[player_id].player_label.add_text(players[player_id].player_name)
	players[player_id].active = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


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
	print(boards[current_board].count_colors())
	_after_ready()
