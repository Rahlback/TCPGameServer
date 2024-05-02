extends Node2D

@onready var boards = $Boards
@onready var board_panel = $BoardPanel


# This is needed because we are adding boards before this node has entered
# the scene tree
var board_counter := 0 

func _ready():
	await get_tree().process_frame 
	if boards.get_child_count() > 0:
		boards.get_child(0).show()
	

func add_board(board: Node2D):
	boards.add_child(board)

func get_size() -> Vector2:
	return board_panel.size


func _on_panel_mouse_entered():
	$MouseOn.show()

func _on_panel_mouse_exited():
	$MouseOn.hide()
