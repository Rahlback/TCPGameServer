extends ScrollContainer

class_name SideBarBoard

const SIDE_BAR_ITEM = preload("res://board_color_game/ui/sidebar/SideBarItem.tscn")
@onready var item_box = $ItemBox

var players = {}

var is_at_bottom = false

func _ready():
	return
	for x in range(0, 100):
		add_player(str(x), x)

func add_player(player_name: String, player_id: int):
	if player_id in players:
		players[player_id].queue_free()
	
	
	var player_item : SideBarItemBoard = SIDE_BAR_ITEM.instantiate()
	player_item.set_player_name(player_name)
	players[player_id] = player_item
	
	item_box.add_child(player_item)
	
	await get_tree().process_frame
	if get_v_scroll_bar().max_value > get_v_scroll() and is_at_bottom:
		set_deferred("scroll_vertical", get_v_scroll_bar().max_value + 200)


func player_offline(player_id: int):
	pass

func remove_player(player_id: int) -> bool:
	if player_id in players:
		players[player_id].queue_free()
	
	return players.erase(player_id)

func _on_mouse_entered():
	is_at_bottom = false

func _on_mouse_exited():
	is_at_bottom = true

