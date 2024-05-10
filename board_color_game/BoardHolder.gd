extends Node2D

@export var boards_per_row := 4

var pos_offset := 0

var previously_arranged_children := 0
var current_x_offset := 0
var current_y_offset := 0

func arrange_children():
	current_x_offset = -1
	current_y_offset = 0
	for child_i in get_child_count():

		var next_x_offset = current_x_offset + 1
		var next_y_offset = current_y_offset
		if next_x_offset >= boards_per_row:
			next_y_offset += 1
			next_x_offset = 0
		
		var child_board := get_child(child_i)
		if not child_board.tree_exited.is_connected(_child_board_removed):
			child_board.tree_exited.connect(_child_board_removed)
		
		child_board.position.x = next_x_offset * child_board.get_size().x
		child_board.position.y = next_y_offset * child_board.get_size().y
		current_x_offset = next_x_offset
		current_y_offset = next_y_offset
		
		previously_arranged_children += 1
			
func _child_board_removed():
	#previously_arranged_children = 0
	#current_x_offset = 0
	#current_y_offset = 0
	arrange_children()


func _on_child_entered_tree(node):
	call_deferred("arrange_children")
