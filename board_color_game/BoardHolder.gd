extends Node2D

@export var boards_per_row := 4

var pos_offset := 0

var previously_arranged_children := 0
var current_x_offset := 0
var current_y_offset := 0

func arrange_children():
	for child_i in get_child_count():
		if child_i > previously_arranged_children:
			var next_x_offset = current_x_offset + 1
			var next_y_offset = current_y_offset
			if next_x_offset >= boards_per_row:
				next_y_offset += 1
				next_x_offset = 0
			
			var child_board = get_child(child_i)
			
			child_board.position.x = next_x_offset * child_board.get_size().x
			child_board.position.y = next_y_offset * child_board.get_size().y
			current_x_offset = next_x_offset
			current_y_offset = next_y_offset
			
			previously_arranged_children += 1
			
			
