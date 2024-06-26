extends Node2D

@onready var boards = $Boards
@onready var board_panel = $BoardPanel
@onready var board_stats = $BoardStats
@onready var player_chart = $CanvasLayer/MouseOn/Panel/VBoxContainer/PlayerChart
@onready var mouse_on = $CanvasLayer/MouseOn
@onready var player_names = $CanvasLayer/MouseOn/Panel/VBoxContainer/PlayerNames

@export var max_points := 100
@export var graph_points := 200 ## Sets how many X points there should be on the graph
# This is needed because we are adding boards before this node has entered
# the scene tree
var board_counter := 0 
var board_showing := 0

func _ready():
	await get_tree().process_frame 
	if boards.get_child_count() > 0:
		show_board(board_showing)
		
		var players = boards.get_child(0).get_player_colors()
		var player_names_dict = boards.get_child(0).get_player_names()
		for player in players:
			player_names.push_color(players[player])
			player_names.append_text(player_names_dict[player] + "\n")
	
	

func show_board(i):
	if i >= 0 and i < boards.get_child_count():
		boards.get_child(board_showing).show()

func hide_showing_board():
	boards.get_child(board_showing).hide()
	
func add_board(board: Node2D):
	boards.add_child(board)
	board.tree_exited.connect(_remove_board.bind(board))

func _remove_board(_board: Node2D):
	if boards.get_child_count() == 0:
		queue_free()

func get_size() -> Vector2:
	return board_panel.size


func _on_panel_mouse_entered():
	mouse_on.show()

func _on_panel_mouse_exited():
	mouse_on.hide()

func _on_switch_left_pressed():
	if board_showing > 0:
		hide_showing_board()
		board_showing -= 1
		show_board(board_showing)

func _on_switch_right_pressed():
	if board_showing < boards.get_child_count()-1:
		hide_showing_board()
		board_showing += 1
		show_board(board_showing)


func _on_stat_update_timer_timeout():
	if not mouse_on.is_visible():
		return
	var current_board = boards.get_child(board_showing)
	var player_stats = {} # {player_id: Array[int] (y_values}
	var num_of_points = len(current_board.get_stats())
	var start_from_point = clamp(num_of_points - max_points, 0, num_of_points)

	var stats = current_board.get_stats()
	for i in range(start_from_point, num_of_points):
		var stat = stats[i]
		# stat = {player_id: score, ...}
		for player_id in stat:
			if not player_id in player_stats:
				player_stats[player_id] = []
			player_stats[player_id].append(stat[player_id])
			
	var d_players : Dictionary = {}
	var d_colors = current_board.get_player_colors()
	for player in d_colors:
		d_players[player] = PackedVector2Array([])
	
	# TODO: Optimize this part. We might be able to send the Vector2 array
	# directly to player_chart.add_plot
	for d_points in current_board.get_stats_last_n_items(graph_points):
		for player in d_points:
			d_players[player].append(Vector2(0, d_points[player]))
	
	for player in d_players:
		player_chart.add_plot(str(player), d_players[player], d_colors[player])

