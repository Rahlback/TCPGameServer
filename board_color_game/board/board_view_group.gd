extends Node2D

@onready var boards = $Boards
@onready var board_panel = $BoardPanel


# This is needed because we are adding boards before this node has entered
# the scene tree
var board_counter := 0 
var board_showing := 0

func _ready():
	await get_tree().process_frame 
	if boards.get_child_count() > 0:
		show_board(board_showing)
	

func show_board(i):
	if i >= 0 and i < boards.get_child_count():
		boards.get_child(board_showing).show()

func hide_showing_board():
	boards.get_child(board_showing).hide()
	
func add_board(board: Node2D):
	boards.add_child(board)

func get_size() -> Vector2:
	return board_panel.size


func _on_panel_mouse_entered():
	$MouseOn.show()

func _on_panel_mouse_exited():
	$MouseOn.hide()

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
