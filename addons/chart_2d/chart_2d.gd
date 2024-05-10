@tool
extends EditorPlugin

func _add_custom_node():
	add_custom_type("Chart2D", 
					"Control", 
					preload("res://addons/chart_2d/chart_2d_logic.gd"), 
					preload("res://icon.svg"))

func _remove_custom_node():
	remove_custom_type("Chart2D")
	
func _reload_node():
	_remove_custom_node()
	_add_custom_node()

func _disable_plugin():
	_remove_custom_node()

func _enable_plugin():
	_add_custom_node()

func _enter_tree():
	_add_custom_node()

func _exit_tree():
	_remove_custom_node()
