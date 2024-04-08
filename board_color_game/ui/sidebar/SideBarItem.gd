extends PanelContainer
class_name SideBarItemBoard

@onready var player_name := $HBox/PlayerName

func set_player_name(player_name_string: String):
	await ready
	player_name.set_text(player_name_string)
