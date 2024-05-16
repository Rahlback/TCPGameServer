extends Control

var players : Dictionary # reference to a dictionary
var chart_plots : Dictionary

@onready var player_names = $StatViewer/PlayerNames
@onready var chart_2d = $StatViewer/Chart2D

## This might have to be changed. But for now this will work great
const SIDE_BAR_ITEM = preload("res://board_color_game/ui/sidebar/SideBarItem.tscn")
func _ready():
	players = {}

## [param player_obj] = board_color_main.Player class
func add_player(player_id: int, player_obj):
	players[player_id] = player_obj
	
func add_line_item(new_line, player_id):
	var n_color = players[player_id].player_color
	new_line.set_color(n_color)
	player_names.add_child(new_line)
	chart_2d.add_plot(str(player_id), chart_plots[player_id], n_color)

func add_line_items():
	for item in player_names.get_children():
		item.queue_free()
		
	var player_arr = players.values()
	
	var mmr_sort = func(playerA, playerB):
		return playerA.mmr > playerB.mmr
	player_arr.sort_custom(mmr_sort)
		
	for player in player_arr:
		var player_name_string = player.player_name + ": " + str(round(player.mmr))
		var new_line := SIDE_BAR_ITEM.instantiate()
		new_line.set_player_name(player_name_string)
		call_deferred("add_line_item", new_line, player.player_id)
		
		if not player.player_id in chart_plots:
			chart_plots[player.player_id] = [Vector2(0, round(player.mmr))]
		else:
			chart_plots[player.player_id].append(Vector2(0, round(player.mmr)))

func _update_player_mmr():
	add_line_items()
	var s = ""
	for player_id in players:
		s += str(player_id) + ": " + str(round(players[player_id].mmr)) + "; "
	#print("ScoreTracker: ", s)
