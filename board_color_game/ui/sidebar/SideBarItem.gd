extends PanelContainer
class_name SideBarItemBoard

@onready var player_name := $HBox/PlayerName
var player_name_memory : String


func set_player_name(player_name_string: String):
	await ready
	player_name.set_text(player_name_string)
	player_name_memory = player_name_string

func set_color(new_color: Color):
	player_name.clear()
	player_name.push_color(new_color)
	player_name.append_text(player_name_memory)
