extends ScrollContainer

class_name SideBarBoard

@export var player_color : Color
@export var player_offline_color : Color

const SIDE_BAR_ITEM = preload("res://board_color_game/ui/sidebar/SideBarItem.tscn")
@onready var item_box = $ItemBox

var players = {}
var is_mouse_hovering = false

func _ready():
	return
	for x in range(0, 100):
		add_player(str(x), x)

func add_player(player_name: String, player_id: int):
	if player_id in players:
		players[player_id].queue_free()
	
	
	var player_item : SideBarItemBoard = SIDE_BAR_ITEM.instantiate()
	player_item.set_player_name(player_name)
	call_deferred("player_offline", player_id, player_color)
	players[player_id] = player_item
	
	item_box.add_child(player_item)
	
	await get_tree().process_frame
	if get_v_scroll_bar().max_value > get_v_scroll() and not is_mouse_hovering:
		set_deferred("scroll_vertical", get_v_scroll_bar().max_value + 200)

func player_online(player_id: int, color := player_color):
	player_offline(player_id, color)

func update_player_color(player_id: int, color : Color):
	players[player_id].set_color(color)

func player_offline(player_id: int, color := player_offline_color):
	players[player_id].set_color(color)

func remove_player(player_id: int) -> bool:
	if player_id in players:
		players[player_id].queue_free()
	
	return players.erase(player_id)

func _on_mouse_entered():
	is_mouse_hovering = true

func _on_mouse_exited():
	is_mouse_hovering = false

func _gui_input(event):
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("DragWindow"):
			position += event.get_relative()
	
