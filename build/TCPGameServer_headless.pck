GDPC                                                                                      /   X   res://.godot/exported/3092355210/export-19418c3edf9a3d188c8320c73219b7e9-SideBarItem.scn��      �      ��k�H��ԥN���77    `   res://.godot/exported/3092355210/export-20f44b057545b4cb9a315e5d8c343b0c-board_color_main.scn    �      5      lx��Y�H"|���$�F    T   res://.godot/exported/3092355210/export-218a8f2b3041327d8a5756f3a245f83b-icon.res   p5     '      m���~^xA�!<�d    T   res://.godot/exported/3092355210/export-35a6b345bcd6ad58c715b11096febeab-board.scn  @j      �      :�g�w�=��7�xp �    X   res://.godot/exported/3092355210/export-3854d556faed144f539f1f683a06d74e-game_server.scnP-     I      m�u�G%��
�dC�    P   res://.godot/exported/3092355210/export-4bb5dece302433d92a561b98178658d4-xx.res p7     '      �za����%~���=    X   res://.godot/exported/3092355210/export-5218b375685b1269c845d916c88c6b00-board_stats.scnPw      �      �R&���!���]�;�    T   res://.godot/exported/3092355210/export-7e1d5d1f520910cfebc408bc0ae5240c-SideBar.scn0�      �      j�Okv8���#�w    T   res://.godot/exported/3092355210/export-865311ccd3f9fa3ad49b591c5d8de441-Logger.scn 2     �      C֚�*/Y��k�7a�    `   res://.godot/exported/3092355210/export-9c6121b09f21d8946291b77b0c4bd106-basic_floor_texture.resГ      '      �XR� w��}�D��    \   res://.godot/exported/3092355210/export-abeb4403404b8119260690a3c43affbf-noise_template.scn 0�      �      e�6ǘ���5�*�q�Q    d   res://.godot/exported/3092355210/export-b6f8418e97da2a6a62ec57a1b3ca46ea-new_noise_texture_2d.res   @�      �      �df��a�c��[�BS    `   res://.godot/exported/3092355210/export-bb0137dabe60e5fd08691157c1308e51-board_view_group.scn   ��      !      tT�h�4�@�7E 9��3    ,   res://.godot/global_script_class_cache.cfg  =     X      ���=�� ����    L   res://.godot/imported/basic_floor.png-ff068142de0c30702a3bce1571484b23.image��      �      ,o�<�Q�71)R���       res://.godot/uid_cache.bin  0C     �      wb�cL�����c�0�Z�    $   res://addons/chart_2d/chart_2d.gd           �      ӒQ}u)w2ԍ1j�g    (   res://addons/chart_2d/chart_2d_line.gd  �      �       &��G4;ގ,Ǵ�5�    (   res://addons/chart_2d/chart_2d_logic.gd �      �      �DD���Q�>��潂    (   res://board_color_game/BoardHolder.gd   p�            �<lb;��p	�\hn�    (   res://board_color_game/BoardViewer.gd   ��      P      7�n-�>�sl�Q�dn��    (   res://board_color_game/board/board.gd   �      �M      �W �\w��c��Oc�    0   res://board_color_game/board/board.tscn.remap   �8     c       �s�yC %_
���:�n    ,   res://board_color_game/board/board_stats.gd  n      !	      ��!�����6�����t    4   res://board_color_game/board/board_stats.tscn.remap 9     i       	�SY@`��b��+.    0   res://board_color_game/board/board_view_group.gd z      Y      MBdS#�J	����    8   res://board_color_game/board/board_view_group.tscn.remap�9     n       �&l����o�D�{�e�    ,   res://board_color_game/board_color_main.gd  �      e8      D�3J�o�n��`@    0   res://board_color_game/board_color_main.gdshaderP�      �      ����u�-��6    4   res://board_color_game/board_color_main.tscn.remap  �:     n       ���!9�ҧt�T�m    8   res://board_color_game/new_noise_texture_2d.tres.remap  @;     r       (<�m}g����ɒP    0   res://board_color_game/noise_template.tscn.remap�;     l       ����c����A6˱4    @   res://board_color_game/ui/dungeon_tiles/basic_floor.png.import  P�      �       �f�����f2��Ѳ�    H   res://board_color_game/ui/dungeon_tiles/basic_floor_texture.png.import  �      �       �.;aj×�������    ,   res://board_color_game/ui/sidebar/SideBar.gd �      0      nʽ��'3�}    4   res://board_color_game/ui/sidebar/SideBar.tscn.remap�9     e       ������[��H]��    0   res://board_color_game/ui/sidebar/SideBarItem.gd �      �      ⺃�H��
|�۶��    8   res://board_color_game/ui/sidebar/SideBarItem.tscn.remap`:     i       ���UQ.�5j���9�r        res://game_server/game_server.gd�     V%      �bQ85}jΆ��|x    (   res://game_server/game_server.tscn.remap0<     i       ����Z�#Fȥzʳ    0   res://game_server/helper_classes/peer_class.gd  �           �O����u�:H_���j       res://icon.svg  p?     �      C��=U���^Qu��U3       res://icon.svg.import   �4     �       UvU�U�Hw���g��        res://logger/Logger.gd  �1     n       `�����?防%��y�        res://logger/Logger.tscn.remap  �<     d       3���,�z���D� �       res://project.binary F     �      ���E���"���w�K�       res://xx.png.import �6     �       ԊC4)�D���P2�|                @tool
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
     extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
   @tool
extends Control

## Currently only supports Line charts


enum plot_type_enum {LINE, PIE, BAR}

@export_group("Chart")
@export var plot_type : plot_type_enum
@export var line_width_px := 3.0
@export var anti_aliased := true
@export var remove_points_outside_chart_area := true
## Use the index in a data set instead of the x value of a Vector2
@export var ignore_x_values := false

@export_group("Axis")
@export var show_axis := true ## Show axis lines
## Skip drawing points outside of the chart area
@export var ignore_values_outside_max := true
@export var max_axis_value := Vector2i(100, 100)
@export var min_axis_value := Vector2i(0, 0)
## Sets the max and min axis values depending on the data provided via [method add_plot]
@export var dynamic_axis_values := false
@export var axis_color : Color = Color.WHITE
@export var axis_line_width := 3

var plots : Dictionary ## {"PlotName": PlotItem}
var axis_drawing : Array[PlotItem]

var pixel_step : Vector2
var mid_point : Vector2

class PlotItem:
	var plot_points : PackedVector2Array
	var plot_color : Color
	var original_points : PackedVector2Array
	
	func _init(points: PackedVector2Array, color: Color, original_p: PackedVector2Array):
		plot_points = points
		plot_color = color
		original_points = original_p



func _ready():
	resized.connect(_size_changed)
	_setup_chart()
	#scale.y = -1
	if Engine.is_editor_hint():
		_editor_stuff()
	else:
		set_physics_process(false)
		

var current_time_step = 0
var calc_stuff_after_time = 2
func _physics_process(delta):
	current_time_step += delta
	if current_time_step > calc_stuff_after_time:
		current_time_step = 0
		_setup_chart()
		_recalculate_plots()
		_editor_stuff()

func _editor_stuff():
	var points : PackedVector2Array = []
	
	var straight_line : PackedVector2Array = []
	var square_p : PackedVector2Array = []
	for x in range(-100, 100):
		var y = sin(x * 0.3) * 20
		points.append(Vector2(x, y))
		
		straight_line.append(Vector2(x, x))
		square_p.append(Vector2(x, (x / 10.0)**2))
		
	var plot_name = "MyFirstPlot"
	add_plot(plot_name, points)
	add_plot("Line", straight_line, Color.RED)
	add_plot("Square_p", square_p, Color.ORANGE_RED)
		
	var parabola : PackedVector2Array
	for x in range(-200, 200):
		var x_f = x / 10.0
		var y = x_f**2.0
		parabola.append(Vector2(x_f, -y + 120))
	add_plot("Parabola", parabola)


func _setup_chart():
	_calculate_pixel_step()
	_calculate_mid_point()
	_set_axis_points()

## Calculates the center point
func _calculate_mid_point():
	var x_length : float = abs(max_axis_value.x - min_axis_value.x)
	var y_length : float = abs(max_axis_value.y - min_axis_value.y)
	
	var x_origo = min_axis_value.x*pixel_step.x
	var y_origo = min_axis_value.y*pixel_step.y
	mid_point = Vector2(-x_origo, size.y + y_origo)

func _calculate_pixel_step():
	var x_length : float = abs(max_axis_value.x - min_axis_value.x)
	var y_length : float = abs(max_axis_value.y - min_axis_value.y)
	pixel_step = Vector2(size.x / x_length, 
						 size.y / y_length)

func _set_axis_points():
	axis_drawing = []
	if not _check_coordinate_inside_chart_area(mid_point):
		return
	var x_axis_points : PackedVector2Array = [Vector2(0, mid_point.y),
											  Vector2(size.x, mid_point.y)]
	var y_axis_points : PackedVector2Array = [Vector2(mid_point.x, 0),
											  Vector2(mid_point.x, size.y)]
	var x_axis = PlotItem.new(x_axis_points, axis_color, [])
	var y_axis = PlotItem.new(y_axis_points, axis_color, [])
	axis_drawing = [x_axis, y_axis]

## Add a plot to the chart. [br]
## [plot_points] is the x and y values of each point. [br]
## If there already is a plot with the same legend name, that plot will be
## overwritten
func add_plot(plot_legend_name: String, plot_points : PackedVector2Array, plot_color := Color.BLACK):
	var coord_points = _convert_points_to_coords(plot_points)
	var new_plot = PlotItem.new(coord_points, plot_color, plot_points)
	plots[plot_legend_name] = new_plot
	queue_redraw()

func _recalculate_plots():
	_setup_chart()
	var duplicate_plots = plots.duplicate(true)
	for plot_name in duplicate_plots:
		var plot : PlotItem = duplicate_plots[plot_name]
		add_plot(plot_name, plot.original_points, plot.plot_color)

func _convert_points_to_coords(plot_points: PackedVector2Array) -> PackedVector2Array:
	var coord_points : PackedVector2Array
	var max_axis_mem = Vector2i(max_axis_value)
	var min_axis_mem = Vector2i(min_axis_value)
	var point_index = 0
	for point in plot_points:
		if ignore_x_values:
			point.x = point_index
		point_index += 1
		
		
		if dynamic_axis_values and not Engine.is_editor_hint():
			if point.x > max_axis_value.x:
				max_axis_value.x = point.x
			if point.x < min_axis_value.x:
				min_axis_value.x = point.x
			if point.y > max_axis_value.y:
				max_axis_value.y = point.y
			if point.y < min_axis_value.y:
				min_axis_value.y = point.y

		#if remove_points_outside_chart_area and not dynamic_axis_values:
			### TODO: Insert points at the edge of the chart, maybe?
			#if point.x > max_axis_value.x or point.y > max_axis_value.y:
				#continue
			#if point.x < min_axis_value.x or point.y < min_axis_value.y:
				#continue
		var coord_point = Vector2(point.x * pixel_step.x + mid_point.x, -point.y * pixel_step.y + mid_point.y)
		if ignore_values_outside_max and not dynamic_axis_values:
			if _check_coordinate_inside_chart_area(coord_point):
				coord_points.append(coord_point)
		else:
			coord_points.append(coord_point)
		
	if max_axis_mem != max_axis_value or min_axis_mem != min_axis_value:
		call_deferred("_recalculate_plots")
	return coord_points

func _check_point_inside_chart_area(point: Vector2):
	var is_point_inside = true
	is_point_inside = is_point_inside and point.x <= max_axis_value.x and point.x >= min_axis_value.x
	is_point_inside = is_point_inside and point.y <= max_axis_value.y and point.y >= min_axis_value.y
	return is_point_inside

func _check_coordinate_inside_chart_area(point: Vector2):
	var is_point_inside = true
	is_point_inside = is_point_inside and point.x >= 0 and point.x <= size.x
	is_point_inside = is_point_inside and point.y >= 0 and point.y <= size.y
	return is_point_inside

func _draw():
	if plot_type == plot_type_enum.LINE:
		if show_axis:
			for axis in axis_drawing:
				if len(axis.plot_points) >= 2:
					draw_polyline(axis.plot_points, axis.plot_color, axis_line_width)
		for plot_name in plots:
			var plot : PlotItem = plots[plot_name]
			if len(plot.plot_points) >= 2:
				draw_polyline(plot.plot_points, plot.plot_color, 
							  line_width_px, anti_aliased)

func _size_changed():
	_recalculate_plots()
               extends Node2D
## A game board. Width and height always needs to be even, if an odd width or
## height is supplied it will be rounded up to the nearest even number.
## [br]
## The board itself is stored as an image.
## [br]
## A player can move if the following conditions are met
## [br]
## 1. The space is not a wall [br]
## 2. Another player is not moving into the same position [br]
## 3. Another player is not occupying the space. This can happen if a player becomes stuck.
#class_name Board

@export var default_width_min = 10
@export var default_width_max = 100
@export var default_height_min = 10
@export var default_height_max = 100
@export var number_of_seeds = 3000
@export var base_tile : Image

const NOISE_TEMPLATE = preload("res://board_color_game/noise_template.tscn")
const NEW_NOISE_TEXTURE_2D = preload("res://board_color_game/new_noise_texture_2d.tres")
const BASIC_FLOOR = preload("res://board_color_game/ui/dungeon_tiles/basic_floor.png")
 
## A dictionary containing each player color in the form {player_id: Color} [br]
## This dictionary is also used to retrieve the players that are playing on this board
var player_colors : Dictionary
var rev_player_colors: Dictionary ## {Color: player_id}
var player_positions : Dictionary ## {player_id: Vector2i}
var player_numbers : Dictionary ## {player_id: player_number}
var rev_player_numbers : Dictionary ## {player_number: player_id}
var player_floors : Dictionary
var player_scores : Dictionary
var stats : Array[Dictionary] ## Move index: {player_id: score, ...}
var player_names : Dictionary ## {player_id: "PlayerName"}

var board : Image
var starting_board : Image
var player_board_tiles : Dictionary
var board_width : int
var board_height : int

var board_data : Array[PackedByteArray]
const WALL_TILE := 255
const WHITE_TILE := 254

var cached_image_scale : int = -1
var cached_scaled_image : Image
var player_layer_image : Image

var board_player_image_layer : Image

var obstacles_serialized : PackedByteArray

var starting_positions : Array[Vector2i]
var movement = {"U": Vector2i(0, -1), "L": Vector2i(-1, 0),
				"R": Vector2i(1, 0),  "D": Vector2i(0, 1)}

var number_of_moves := 0

var history : Array[HistoryItem] ## {
var current_history_step = 0

@onready var base_image := $base_image
#@onready var player_image = $player_image


class HistoryItem:
	var player_positions # [{player_id: pos, player_id: pos, ...}]

func _ready():
	print("Board is ready!")

## Generates a board that is 4 player symmetrical.
## [br] Starts by generating a tile in the upper left corner, and mirrors
## it down to the bottom left corner. Then mirror the left half over to the 
## right half.
## [br]
## Returns the board image in order to facilitate recursive image generation.
## You do not need to capture the return value.
func generate_random_board(width: int = 0, height: int = 0, main := true):
	if width == 0:
		width = randi_range(default_width_min, default_width_max)
	if height == 0:
		height = randi_range(default_height_min, default_height_max)
		
	if width % 2:
		width += 1
	if height % 2:
		height += 1
	
	#width = 18
	#height = 42
	
	var noise : NoiseTexture2D = NEW_NOISE_TEXTURE_2D.duplicate(0)
	noise.set_width(width/2)
	noise.set_height(height/2)
	var seed_number = randi() % number_of_seeds
	noise.noise.set_seed(seed_number)
	#print("Using seed: ", seed_number, " w=", width, ", h=", height)
	await noise.changed

	var board_image := Image.create(width, height, false, Image.FORMAT_RGBA8)
	
	var img: Image = noise.get_image()
	
	var player_pos = Vector2i(width/16, height/16)
	img.set_pixelv(player_pos, Color.RED)
	
	for y in img.get_height():
		for x in img.get_width():
			var pixel_color = img.get_pixel(x, y)
			board_image.set_pixel(x, y, pixel_color) # Top left corner
			board_image.set_pixel(x, height - 1 - y, pixel_color) # Lower left corner
			board_image.set_pixel(width - 1 - x, y, pixel_color) # Upper right corner
			board_image.set_pixel(width - 1 - x, height - 1 - y, pixel_color) # Lower right corner
	if not validate_board(board_image, player_pos):
		board_image = await generate_random_board(width, height, false)
		
		
	board = board_image
	
		
	if main:
		for y in board_image.get_height():
			var row : PackedByteArray = []
			for x in board_image.get_width():
				if compare_colors(board_image.get_pixel(x, y), Color.BLACK):
					row.append(WALL_TILE)
				else:
					row.append(WHITE_TILE)
			board_data.append(row)
		starting_positions.append(player_pos)
		starting_positions.append(Vector2i(player_pos.x, height - 1 - player_pos.y))
		starting_positions.append(Vector2i(width - 1 - player_pos.x, player_pos.y))
		starting_positions.append(Vector2i(width - 1 - player_pos.x, height - 1 - player_pos.y))
		
		board_width = len(board_data[0])
		board_height = len(board_data)

	return board


## Setup players. Will assign start positions to each player and save colors.
## Should be called after generating a board
## [br]. players = {player_id: Color}
func setup_players(players: Dictionary):
	if not board_data:
		return
	player_colors = players
	
	var current_start_pos = 0
	for player_id in players:
		player_scores[player_id] = 1
		var start_pos : Vector2i = starting_positions[current_start_pos]
		board_data[start_pos.y][start_pos.x] = current_start_pos + 1
		player_positions[player_id] = starting_positions[current_start_pos]
		
		# TODO: Remove from here when board_data works
		rev_player_colors[players[player_id]] = player_id
		board.set_pixelv(player_positions[player_id], player_colors[player_id])
		# To here
		
		current_start_pos += 1
		player_numbers[player_id] = current_start_pos
		rev_player_numbers[current_start_pos] = player_id
		
		# Setup tiles
		var new_board_tile := BASIC_FLOOR.duplicate()
		for x in new_board_tile.get_width():
			for y in new_board_tile.get_height():
				var pixel = new_board_tile.get_pixel(x, y)
				if compare_colors(Color8(36, 36, 36), pixel):
					new_board_tile.set_pixel(x, y, players[player_id])
		player_board_tiles[player_id] = new_board_tile
		
	stats.append(player_scores.duplicate(true))
	starting_board = board.duplicate(true)


## Gets the player number, i.e. player 1, 2, 3 or 4 from the player id.
func get_player_number(player_id) -> int:
	if player_id in rev_player_numbers:
		return rev_player_numbers[player_id]
	else:
		return -1

## Get player id from player number. Player number is 1, 2, 3 or 4.
func get_player_id_from_number(player_number) -> int:
	if player_number in player_numbers:
		return player_numbers[player_number]
	else:
		return -1

## Get a serialized version of the positions.
## [br]
## 12 bytes in total [br]
## 3 bytes per player, starting with player 1 and going up to player 4 [br]
## Example, player -> [x, y] coordinates: [br] 
## player 1 -> [0, 0] = byteArray(1, 0, 0) [br]
## player 2 -> [5, 3] = byteArray(2, 5, 3) [br]
## player 3 -> [2, 5] = byteArray(3, 2, 5) [br]
## player 4 -> [1, 2] = byteArray(4, 1, 2) [br]
## Will give the following byte array [br]
## 1, 0, 0, 2, 5, 3, 3, 2, 5, 4, 1, 2 [br] [br] There will be no extra preamble
func get_serialized_player_number_positions() -> PackedByteArray:
	var data : PackedByteArray = []
	for player_number in player_numbers:
		var player_pos : Vector2i = player_positions[player_number]
		data.append(player_numbers[player_number])
		data.append(player_pos.x)
		data.append(player_pos.y)
	return data
	

func validate_board(board_img: Image, start_pos: Vector2i, no_single_lanes = true):
	var current_pos = start_pos
	var already_visited: Array[Vector2i] = [start_pos]
	var queue: Array[Vector2i] = [current_pos]
	
	var width = board_img.get_width()
	var height = board_img.get_height()
	
	var number_of_reds = 0
	while not queue.is_empty():
		current_pos = queue.pop_back()
		already_visited.append(current_pos)
		
		var current_pixel = board_img.get_pixelv(current_pos)
		if current_pixel.r == 1 and current_pixel.b != 1:
			number_of_reds += 1
			#print("number_of_reds: ", number_of_reds, " current_pos: ", current_pos)
		if number_of_reds >= 3 or (no_single_lanes == false and number_of_reds >= 2):
			return true

		for move in movement:
			var next_pos = current_pos + movement[move]
			if next_pos.x < 0 or next_pos.x >= width:
				continue
			if next_pos.y < 0 or next_pos.y >= height:
				continue
			if next_pos in already_visited or next_pos in queue:
				continue
			
			var pixel_color = board_img.get_pixelv(next_pos)
			
			if pixel_color != Color.BLACK:
				queue.append(next_pos)
	#print("Returning false")
	return false
	
## Returns an up-scaled image of the board image. 
func get_scaled_image(_scale: int = 5): # TODO remove _scale
	if cached_scaled_image:
		return _get_cached_scaled_image()
	
	var dungeon_floor := BASIC_FLOOR
	
	var tile_width = dungeon_floor.get_width()
	var tile_height = dungeon_floor.get_height()
	
	var wall_tile_img : Image = dungeon_floor.duplicate()
	wall_tile_img.fill(Color.BLACK)
	
	var scaled_image = Image.create(len(board_data[0]) * tile_width, 
									len(board_data) * tile_height, false, Image.FORMAT_RGBA8)
	
	var scaled_pixel_rect = Rect2i(0, 0, tile_width, tile_height)
	var y = 0
	var x = 0
	for row in board_data:
		for tile in row:
			# Tile is the player number, wall number or clear number
			var blit_image
			match tile:
				WALL_TILE:
					blit_image = wall_tile_img
				WHITE_TILE:
					blit_image = dungeon_floor
				_:
					var player_id = rev_player_numbers[tile]
					blit_image = player_board_tiles[player_id]

			scaled_image.blit_rect(blit_image, scaled_pixel_rect, Vector2i(x, y))
			x += tile_width
		x = 0
		y += tile_height
	
	cached_scaled_image = scaled_image.duplicate()
	#cached_scaled_image.copy_from(scal6ed_image)
	var player_rect = Rect2i(0, 0, tile_width/2, tile_height/2)
	var player_image = Image.create(tile_width/2, tile_height/2, false, Image.FORMAT_RGBA8)
	player_image.fill(Color.CORAL)
	for player_id in player_positions:
		var pos = player_positions[player_id] * tile_width
		pos += Vector2i(tile_width/4, tile_height/4)
		scaled_image.blit_rect(player_image, player_rect, pos)
	
	#scaled_image.save_png("./test_images/" + str(randi()) + ".png")
	return scaled_image

func _get_cached_scaled_image(_scale: int = 5): # TODO remove _scale
	#var scaled_pixel = Image.create(scale, scale, false, Image.FORMAT_RGBA8)
	
	var tile_width = BASIC_FLOOR.get_width()
	var tile_height = BASIC_FLOOR.get_height()
	var scaled_pixel_rect = Rect2i(0, 0, tile_width, tile_height)
	
	for player_id in player_colors:
		var pos = player_positions[player_id]
		pos.x *= tile_width
		pos.y *= tile_height
		
		cached_scaled_image.blit_rect(player_board_tiles[player_id], 
									  scaled_pixel_rect, Vector2i(pos[0], pos[1]))
	
	var scaled_image = Image.new()
	scaled_image.copy_from(cached_scaled_image)

	var player_rect = Rect2i(0, 0, tile_width/2, tile_height/2)
	var player_image = Image.create(tile_width/2, tile_height/2, false, Image.FORMAT_RGBA8)
	player_image.fill(Color.CORAL)
	for player_id in player_positions:
		var pos = player_positions[player_id] * tile_width
		pos += Vector2i(tile_width/4, tile_height/4)
		scaled_image.blit_rect(player_image, player_rect, pos)
	return scaled_image

func _redraw_image():
	cached_scaled_image = null
	_update_images()
	

## Tiles are 32x32 pixels
func _update_images():
	base_image.set_texture(ImageTexture.create_from_image(get_scaled_image()))

func _create_base_image():
	var x_scale = base_tile.get_width()
	var y_scale = base_tile.get_height()
	var scaled_image = Image.create(board.get_width() * x_scale, 
									board.get_height() * y_scale, false, Image.FORMAT_RGBA8)
	
	var black_box = Image.create(x_scale, y_scale, false, Image.FORMAT_RGBA8)
	black_box.fill(Color.BLACK)
	var scaled_pixel_rect = Rect2i(0, 0, x_scale, y_scale)
	
	for y in board.get_height():
		for x in board.get_width():
			var current_pixel_color = board.get_pixel(x, y)
			var blit_image = base_tile
			if compare_colors(current_pixel_color, Color.BLACK):
				blit_image = black_box
			
			scaled_image.blit_rect(blit_image, scaled_pixel_rect, Vector2i(x * x_scale, y * y_scale))
	
	base_image.set_texture(ImageTexture.create_from_image(scaled_image))
	base_image.show()

func _create_player_image():
	var x_scale = base_tile.get_width()
	var y_scale = base_tile.get_height()
	var scaled_image = Image.create(board.get_width() * x_scale, 
									board.get_height() * y_scale, false, Image.FORMAT_RGBA8)
	
	var background_color = Color.WHITE
	background_color.a = 0.0
	
	scaled_image.fill(background_color)
	
	var pixel = Image.create(x_scale, y_scale, false, Image.FORMAT_RGBA8)
	var scaled_pixel_rect = Rect2i(0, 0, x_scale, y_scale)
	for y in board.get_height():
		for x in board.get_width():
			var current_pixel_color = board.get_pixel(x, y)
			if compare_colors(current_pixel_color, Color.BLACK):
				continue
			if compare_colors(current_pixel_color, Color.WHITE):
				continue
			
			pixel.fill(current_pixel_color)
			scaled_image.blit_rect(pixel, scaled_pixel_rect, Vector2i(x * x_scale, y * y_scale))
	
	#player_image.set_texture(ImageTexture.create_from_image(scaled_image))
	#player_image.show()
	player_layer_image = scaled_image
	
## Returns true if the colors are the same
func compare_colors(a: Color, b: Color):
	return a.r == b.r and a.g == b.g and a.b == b.b


func is_wall(pos: Vector2i):
	return board_data[pos.y][pos.x] == WALL_TILE

func is_oob(pos: Vector2i):
	var oob = pos.x < 0 or pos.x >= board_width
	oob = oob or (pos.y < 0 or pos.y >= board_height)
	return oob

## Simulates the next step. Returns a list of new player positions. [br]
## player_moves = {player_id: "X"}
func take_moves(player_moves: Dictionary, save_history := false):
	var next_player_pos: Dictionary = {} # {player_id: Vector2i}
	var desired_next_pos: Dictionary = {} # {Vector2i: player_id}
	var occupied_spaces = []
	# Check for walls
	for player_id in player_moves:
		var move = movement[player_moves[player_id]]
		var next_pos = player_positions[player_id] + move
		if is_oob(next_pos) or is_wall(next_pos): # Wall check
			next_player_pos[player_id] = player_positions[player_id]
			occupied_spaces.append(next_player_pos[player_id])
		elif next_pos in desired_next_pos: # Move into the same spot
			next_player_pos[player_id] = player_positions[player_id]
			var other_player = desired_next_pos[next_pos]
			next_player_pos[other_player] = player_positions[other_player]
			occupied_spaces.append(next_player_pos[other_player])
			occupied_spaces.append(next_player_pos[player_id])
		else:
			desired_next_pos[next_pos] = player_id
	
	for pos in desired_next_pos:
		var player_id = desired_next_pos[pos]
		if not player_id in next_player_pos and not pos in occupied_spaces:
			next_player_pos[player_id] = pos
	
	# Check for head-on collisions. This happens if two players try to swap
	# places
	for player_id in next_player_pos:
		for other_player in next_player_pos:
			if next_player_pos[player_id] == player_positions[other_player]:
				if next_player_pos[other_player] == player_positions[player_id]:
					next_player_pos[player_id] = player_positions[player_id]
					next_player_pos[other_player] = player_positions[other_player]
			
	
	for player_id in next_player_pos:
		var pos : Vector2i = next_player_pos[player_id]
		
		var tile_number = board_data[pos.y][pos.x]
		if tile_number != WALL_TILE and tile_number != WHITE_TILE:
			player_scores[rev_player_numbers[tile_number]] -= 1
		
		board_data[pos.y][pos.x] = player_numbers[player_id]
		player_positions[player_id] = next_player_pos[player_id]
		
		player_scores[player_id] += 1
	
	stats.append(player_scores.duplicate(true))
		
	if save_history:
		var history_item = HistoryItem.new()
		history_item.player_positions = player_positions.duplicate(true)
		history.append(history_item)
	
	number_of_moves += 1
	
	if is_visible():
		_update_images()
		
	#if base_image.is_node_ready():

func history_playback_setup():
	board = starting_board
	return board

func history_playback_step():
	if current_history_step >= history.size():
		return true
	var history_item = history[current_history_step]
	for player_id in history_item.player_positions:
		board.set_pixelv(history_item.player_positions[player_id], player_colors[player_id])
		player_positions[player_id] = history_item.player_positions[player_id]
	current_history_step += 1
	return false

func count_colors():
	var colors: Dictionary = {}
	var pixel_data = board.get_data()
	var offset = 0
	while offset < pixel_data.size():
		var color_slice = pixel_data.slice(offset, offset+4)
		var color = Color(color_slice[0], color_slice[1], color_slice[2], color_slice[3])
		if not color in colors:
			colors[color] = 1
		else:
			colors[color] += 1
		offset += 4
	return colors

## Turn board into a string?
## TODO Decide serialized version of board
## The serialized board consists of 4 bytes followed by several blocks of bytes.
## [br] The first 4 bytes describe the width and the height of the board.
## [br] Each "block" of bytes after describes a single row in the board.
## [br] A wall = 0b1, and an empty tile = 0b0 [br]
## The serialized version of the board is of the form: [br]
## 2 bytes -> width of board, this is the number of bits needed for a single row [br]
## 2 bytes -> height of board (number of rows)[br]
## number of rows (blocks of bytes) [ [br]
##		number_of_bytes_per_row
## ]
func serialize_board():
	# TODO Update to new board_data version
	# width = 15
	var bits_per_row = board.get_width()
	
	var pixel_data = board.get_data()
	var simple_data: Array[int] = []
	var current_num := 0
	
	var byte_offset = 0

	var row_bits := 0
	while byte_offset < pixel_data.size():
		var color_slice = pixel_data.slice(byte_offset, byte_offset+4)
		var color = Color(color_slice[0], color_slice[1], color_slice[2], color_slice[3])
		var current_bit := 0
		if compare_colors(Color.BLACK, color):
			current_bit = 1
		
		current_num = (current_num << 1) + current_bit
		row_bits += 1
		if row_bits == bits_per_row:
			simple_data.append(current_num)
			current_num = 0
			row_bits = 0
		
		byte_offset += 4
	
	obstacles_serialized.clear()
	for row in simple_data:
		var row_bits_b := 0
		var byte_mask = 0xff
		while row_bits_b < bits_per_row:
			obstacles_serialized.append(row & byte_mask)
			row_bits_b += 8
			row >>= 8
		
	return obstacles_serialized
	
		
## Returns a serialized version of the complete board, including player tiles.
## [br]
## The width gives the number of bytes needed for a single row, and the height
## specifies how many rows this data set will contain.
## Format: [br]
## [ [br]
## 	1 byte: width,
## 	1 byte: height,
## 		[[br] width number of bytes: A single row ]
## 
func get_full_board_serialized():
	var serialized_board : PackedByteArray = []
	serialized_board.append(board_width)
	serialized_board.append(board_height)
	for row in board_data:
		serialized_board.append_array(row)
	return serialized_board

## Returns the board layout, only including white spaces (zeroes) and walls (ones)
func get_obstacle_serialized():
	if obstacles_serialized:
		return obstacles_serialized

	else:
		return serialize_board()
		
func get_width():
	return board.get_width()
	
func get_height():
	return board.get_height()

func get_number_of_moves():
	return number_of_moves

func get_stats():
	return stats

func get_stats_last_n_items(n: int):
	return stats.slice(-n)
	
func get_player_colors():
	return player_colors

func get_player_names():
	return player_names

## Expects a dictionary = {player_id: "PlayerName}
func set_player_names(names: Dictionary):
	player_names = names

# TODO
# Function to get updated state of the board 
# Save history of the players? In order to be able to repeat it.
# Maybe just have an observer instead?
# Maybe if there is a flag so that the memory consumption isn't too high

func _on_base_image_ready():
	#call_deferred("_update_images")
	pass


func _on_visibility_changed():
	call_deferred("_redraw_image")
  RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script &   res://board_color_game/board/board.gd ��������   Image 8   res://board_color_game/ui/dungeon_tiles/basic_floor.png a����<O      local://PackedScene_r3628 k         PackedScene          	         names "         Board    visible    script 
   base_tile    Node2D    base_image 	   Sprite2D    _on_visibility_changed    visibility_changed    _on_base_image_ready    ready    	   variants                                       node_count             nodes        ��������       ����                                        ����              conn_count             conns                                        
   	                    node_paths              editable_instances              version             RSRC               extends Control

@export var line_width := 3
@export var anti_aliasing_enabled := true

var points : Dictionary ## Dictionary{Line_id: Array[int], ...}

var draw_points : Dictionary ## {line_id: PackedVector2Array, ...}
var draw_colors : Dictionary ## {line_id: PackedColorArray, ...}

var max_points := 0

var width := 200.0
var height := 200.0


class Points:
	var color : Color
	var points : Array[Vector2]

func set_all_points(vals_and_line_ids: Dictionary):
	print_debug("Setting all points: ")
	points = vals_and_line_ids.duplicate(true)
	
	for line_id in points:
		max_points = max(len(points[line_id]), max_points)

func set_colors(line_color_inp: Dictionary):
	for line_id in line_color_inp:
		if line_id in draw_points:
			draw_points[line_id].color = line_color_inp[line_id]

func set_points(vals: Array[int], line_id):
	points[line_id] = vals.duplicate(true)
	max_points = max(vals, max_points)

func add_point(val: int, line_id):
	if line_id in points:
		points[line_id].append(val)
		max_points = max(points[line_id], max_points)

## [line_colors_inp] => Dictionary {line_id: Color, ...}
func draw_graph(line_colors_inp = null):
	# Calculate pixels per x component
	var pixel_step_x = width / max_points
	var pixel_step_y = height / 50 # We need to know the max number you can get
	#print_debug(pixel_step_x, ", max_points=", max_points)
	
	draw_points.clear()
	for line_id in points:
		# Points = {Line_id: Array[int], ...}
		var line_points : PackedVector2Array = []
		var point_colors : PackedColorArray = []
		#if line_colors_inp:
			#if line_id in line_colors_inp:
				#line_points.color = line_colors_inp[line_id]
		var x = 0.0
		for p in points[line_id]:
			#print(p)
			# p = int, y value
			line_points.append(Vector2(x * pixel_step_x, -p * pixel_step_y))
			if line_id in line_colors_inp:
				point_colors.append(line_colors_inp[line_id])
			x += 1
		draw_points[line_id] = line_points
		draw_colors[line_id] = point_colors

	
	queue_redraw()

func _draw():
	for line in draw_points:
		if len(draw_points[line]) <= 1:
			continue

		if line in draw_colors:
			draw_polyline_colors(draw_points[line], 
								 draw_colors[line], 
								 line_width, 
								 anti_aliasing_enabled)
		else:
			draw_polyline(draw_points[line], 
								 Color.BLACK, 
								 line_width, 
								 anti_aliasing_enabled)







               RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script ,   res://board_color_game/board/board_stats.gd ��������      local://PackedScene_srwo2 #         PackedScene          	         names "         BoardStats    layout_mode    anchors_preset    script    Control    	   variants                                    node_count             nodes        ��������       ����                                conn_count              conns               node_paths              editable_instances              version             RSRC extends Node2D

@onready var boards = $Boards
@onready var board_panel = $BoardPanel
@onready var board_stats = $BoardStats
@onready var player_chart = $CanvasLayer/MouseOn/Panel/VBoxContainer/PlayerChart
@onready var mouse_on = $CanvasLayer/MouseOn
@onready var player_names = $CanvasLayer/MouseOn/Panel/VBoxContainer/PlayerNames

@export var max_points := 100
@export var graph_points := 200 ## Sets how many X points there should be on the graph
# This is needed because we are adding boards before this node has entered
# the scene tree
var board_counter := 0 
var board_showing := 0

func _ready():
	await get_tree().process_frame 
	if boards.get_child_count() > 0:
		show_board(board_showing)
		
		var players = boards.get_child(0).get_player_colors()
		var player_names_dict = boards.get_child(0).get_player_names()
		for player in players:
			player_names.push_color(players[player])
			player_names.append_text(player_names_dict[player] + "\n")
	
	

func show_board(i):
	if i >= 0 and i < boards.get_child_count():
		boards.get_child(board_showing).show()

func hide_showing_board():
	boards.get_child(board_showing).hide()
	
func add_board(board: Node2D):
	boards.add_child(board)
	board.tree_exited.connect(_remove_board.bind(board))

func _remove_board(_board: Node2D):
	if boards.get_child_count() == 0:
		queue_free()

func get_size() -> Vector2:
	return board_panel.size


func _on_panel_mouse_entered():
	mouse_on.show()

func _on_panel_mouse_exited():
	mouse_on.hide()

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


func _on_stat_update_timer_timeout():
	if not mouse_on.is_visible():
		return
	var current_board = boards.get_child(board_showing)
	var player_stats = {} # {player_id: Array[int] (y_values}
	var num_of_points = len(current_board.get_stats())
	var start_from_point = clamp(num_of_points - max_points, 0, num_of_points)

	var stats = current_board.get_stats()
	for i in range(start_from_point, num_of_points):
		var stat = stats[i]
		# stat = {player_id: score, ...}
		for player_id in stat:
			if not player_id in player_stats:
				player_stats[player_id] = []
			player_stats[player_id].append(stat[player_id])
			
	var d_players : Dictionary = {}
	var d_colors = current_board.get_player_colors()
	for player in d_colors:
		d_players[player] = PackedVector2Array([])
	
	# TODO: Optimize this part. We might be able to send the Vector2 array
	# directly to player_chart.add_plot
	for d_points in current_board.get_stats_last_n_items(graph_points):
		for player in d_points:
			d_players[player].append(Vector2(0, d_points[player]))
	
	for player in d_players:
		player_chart.add_plot(str(player), d_players[player], d_colors[player])

       RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script 1   res://board_color_game/board/board_view_group.gd ��������   PackedScene .   res://board_color_game/board/board_stats.tscn Y�AՏ<   Script (   res://addons/chart_2d/chart_2d_logic.gd ��������      local://PackedScene_m3btn �         PackedScene          	         names "   5      BoardViewGroup    script    Node2D    BoardPanel    anchors_preset    anchor_left    anchor_top    anchor_right    anchor_bottom    offset_left    offset_top    offset_right    offset_bottom    grow_horizontal    grow_vertical    Panel    NavigationButtons    HBoxContainer    SwitchLeft    layout_mode    text    Button    SwitchRight    Boards    BoardStats    StatUpdateTimer 
   wait_time 
   autostart    Timer    CanvasLayer    MouseOn    visible    mouse_filter    Control    VBoxContainer    custom_minimum_size    PlayerChart    ignore_x_values 
   show_axis    max_axis_value    dynamic_axis_values    PlayerNames    fit_content    RichTextLabel    _on_panel_mouse_entered    mouse_entered    _on_panel_mouse_exited    mouse_exited    _on_switch_left_pressed    pressed    _on_switch_right_pressed    _on_stat_update_timer_timeout    timeout    	   variants                             ?    ���    ��C           ��     �C     ��     �C      <       >               �B     ��)   �������?                              @lD    ��C     �D    @ D     HC
     HC  HC     GC
       \��B         -                 node_count             nodes     �   ��������       ����                            ����                                 	      
                                                ����   	      
               	                    ����            
                    ����                                 ����                ���         	      
                                    ����                                 ����               !      ����                     	      
                             	             ����                                
       "   "   ����   #                                          !   $   ����   #                         %      &      '      (                 +   )   ����                *                conn_count             conns     #          -   ,                     /   .                     1   0                     1   2                     4   3                    node_paths              editable_instances              version             RSRC               GDIM   png�PNG

   IHDR           szz�  ZIDATXG����0D�	�D��-�r%"J�wv�~���g;���z����<O̼=����}�?�g�-�:��K�~�|���7 ��!�؟G6n�SB@F�Jy��tt*̐�	+�($f$m���(�(�����|�@U�v�j�@1��$�����.|W�i?;�>��4������v\�T%�dB���'6"4a���� �3��.�̲�I���� uN��yf�vg�ׁ�����Vj��(w)�:Ǳ@dHބ���Kݏ{����i }��3E(��I���Q^y%�$S�v�A泻�7a�d�y�f�1�/��a;���V�K U�Y|f4bjz�t��� �Kn��:D�    IEND�B`�  [remap]

importer="image"
type="Image"
uid="uid://5db5sm6ylk5f"
path="res://.godot/imported/basic_floor.png-ff068142de0c30702a3bce1571484b23.image"
            [remap]

importer="texture"
type="PlaceholderTexture2D"
uid="uid://c076bkk2ucrxy"
metadata={
"vram_texture": false
}
path="res://.godot/exported/3092355210/export-9c6121b09f21d8946291b77b0c4bd106-basic_floor_texture.res"
   RSRC                    PlaceholderTexture2D            ��������                                                  resource_local_to_scene    resource_name    size    script        #   local://PlaceholderTexture2D_dn1ig �          PlaceholderTexture2D       
      B   B      RSRC         extends ScrollContainer

class_name SideBarBoard

@export var player_color : Color
@export var player_offline_color : Color

const SIDE_BAR_ITEM = preload("res://board_color_game/ui/sidebar/SideBarItem.tscn")
@onready var item_box = $ItemBox

var players = {}
var is_mouse_hovering = false

func _ready():
	return
	#for x in range(0, 100):
		#add_player(str(x), x)

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
	
RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script -   res://board_color_game/ui/sidebar/SideBar.gd ��������      local://PackedScene_aokbi $         PackedScene          	         names "         SideBar    offset_left    offset_top    offset_right    offset_bottom    size_flags_horizontal    size_flags_vertical    mouse_filter    script    player_color    player_offline_color    ScrollContainer    ItemBox    layout_mode    VBoxContainer    _on_mouse_entered    mouse_entered    _on_mouse_exited    mouse_exited    	   variants    
         B     �B     �C     D                            �?  �?  �?  �?     �?          �?            node_count             nodes     &   ��������       ����
                                                    	      
                        ����      	                   conn_count             conns                                                                node_paths              editable_instances              version             RSRC       extends PanelContainer
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
   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    content_margin_left    content_margin_top    content_margin_right    content_margin_bottom 	   bg_color    draw_center    skew    border_width_left    border_width_top    border_width_right    border_width_bottom    border_color    border_blend    corner_radius_top_left    corner_radius_top_right    corner_radius_bottom_right    corner_radius_bottom_left    corner_detail    expand_margin_left    expand_margin_top    expand_margin_right    expand_margin_bottom    shadow_color    shadow_size    shadow_offset    anti_aliasing    anti_aliasing_size    script 	   _bundled       Script 1   res://board_color_game/ui/sidebar/SideBarItem.gd ��������      local://StyleBoxFlat_b15yj �         local://PackedScene_xs6vq �         StyleBoxFlat    	                  PackedScene          	         names "         SideBarItem    custom_minimum_size    offset_right    offset_bottom    mouse_filter    script    PanelContainer    HBox    layout_mode    HBoxContainer    PlayerName    size_flags_horizontal    text    fit_content    RichTextLabel    VSeparator    visible     theme_override_styles/separator    ConnectionStatus    scroll_active    	   variants    
   
     aC         aC     �A                            PlayerName                              node_count             nodes     M   ��������       ����                                              	      ����                             
   ����                                                  ����                        	                    ����                                           conn_count              conns               node_paths              editable_instances              version             RSRC       extends Node2D

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


func _on_child_entered_tree(_child):
	call_deferred("arrange_children")
 extends Node2D

@export var x_step := 100
@export var y_step := 100

var x_offset = 0
var y_offset = 0

var switch_row_tracker : int = 0

var board_groups : Dictionary


func add_board(initial_image:  Image, board_group : int):
	if not board_group in board_groups:
		board_groups[board_group] = []
	
	#var number = get_child_count()
	#initial_image.save_png("./images/" + str(number) + ".png")
	
	
	var new_sprite : Sprite2D = Sprite2D.new()
	new_sprite.position.x = x_offset
	new_sprite.position.y = y_offset
	
	x_offset += x_step
	new_sprite.set_texture(ImageTexture.create_from_image(initial_image))
	add_child(new_sprite)
	switch_row_tracker += 1
	if switch_row_tracker == 10:
		y_offset += y_step
		x_offset = 0
		switch_row_tracker = 0
	board_groups[board_group].append(new_sprite)

func update_board(new_image: Image, board_group : int, index: int):
	if not board_group in board_groups:
		add_board(new_image, board_group)
	if index >= len(board_groups[board_group]):
		add_board(new_image, board_group)
		
	board_groups[board_group][index].set_texture(ImageTexture.create_from_image(new_image))

extends Node2D

@export_category("Board setup")
@export var number_of_simultaneous_games := 10
@export var number_of_boards_per_group := 100
@export_group("Board size")
@export var min_board_width := 5
@export var min_board_height := 5
@export var max_board_width := 15
@export var max_board_height := 15
@export var image_scale := 5

@export_group("Game rules")
@export var moves_until_game_over := 500

@export_group("Player colors")
@export var possible_colors: Array[Color]

@export_group("Debug")

## Deprecated. Displays all boards being played
@export var show_boards := false 


var players : Dictionary
var observers : Dictionary # {observer_id: bool active}
#var board_template = preload("res://board_color_game/board/board.gd")
const BOARD = preload("res://board_color_game/board/board.tscn")
const BOARD_VIEW_GROUP = preload("res://board_color_game/board/board_view_group.tscn")

var board_groups : Dictionary
var board_group_queue: Array[int]
var board_group_moves : Dictionary
var board_group_id_latest = -1
#var boards : Array[Board] = []
const number_of_players_on_board = 4

var move_counter := 0.0
var move_prev_time := 0
var move_time_delta := 0
var time_start := 0

var zoom := Vector2(1, 1)

# Onready items
@onready var side_bar = $UI/SideBar
@onready var move_counter_ui = $UI/MoveCounter
@onready var board_holder = $BoardHolder
@onready var board_queue_timer = $BoardQueueTimer


# debug
var lost_moves = 0 

class Player:
	var player_name : String
	var active : bool
	var disconnect_time : int = 0
	var observers : Array[int] # A list of all observers
	var board_group : int = -1
	
	var score = 0

	func _init(player_name_inp: String):
		self.player_name = player_name_inp
		self.active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	GameServer.peer_connected.connect(_player_connected)
	GameServer.peer_disconnected.connect(_player_disconnected)
	GameServer.peer_reconnected.connect(_player_reconnected)
	GameServer.peer_message_received.connect(_receive_message)
	if GameServer.start() != 0:
		print("Failed to start game server")
	
	# Fix bug when camera zoom is set in editor
	# TODO: The zoom level should be moved to the camera.
	zoom = $Camera.get_zoom()
	Performance.add_custom_monitor("Connected players", _get_num_of_connected_players)

func _get_num_of_connected_players():
	var num_of_active_players := 0
	for player in players:
		if players[player].active:
			num_of_active_players += 1
	return num_of_active_players

var players_test = {10: Color.CADET_BLUE, 11: Color.CHARTREUSE, 12: Color.YELLOW_GREEN, 13: Color.WEB_MAROON}

# This is for testing
#var current_board = 0
#func _after_ready():
	#var gen_start_time = Time.get_ticks_msec()
	#$Sprite2D.set_texture(ImageTexture.create_from_image(boards[current_board].get_scaled_image(20)))
	##print("Time to scale image: ", Time.get_ticks_msec() - gen_start_time, " ms")
#
#func _show_board(board_group: int, board_index: int):
	#$BoardViewer.update_board(board_groups[board_index].get_scaled_image(image_scale), board_index)
	##$Sprite2D.set_texture(ImageTexture.create_from_image(board.get_scaled_image(25)))

# This is for testing
var next_moves = {10: "R", 12: "L", 11: "R", 13: "L"}
var valid_moves = ["R", "L", "U", "D"]

func _unhandled_input(event):
	# TODO: The zoom functionality should be moved to the camera node
	if event.is_action_pressed("CameraZoomIn"):
		zoom += Vector2(0.05, 0.05)
		zoom = zoom.clamp(Vector2(0.1, 0.1), Vector2(5, 5))
		$Camera.set_zoom(zoom)
		
	if event.is_action_pressed("CameraZoomOut"):
		zoom -= Vector2(0.05, 0.05)
		zoom = zoom.clamp(Vector2(0.1, 0.1), Vector2(5, 5))
		$Camera.set_zoom(zoom)

func _input(event):
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("CameraPan"):
			$Camera.position -= (event.relative / zoom)

func _player_connected(player_id: int, player_name: String):
	if player_name == "observer":
		#observers.append(player_id)
		print("Observer connected. Don't really do anything")
		return
	print_debug("Player connected: %s %s" % [player_id, player_name])
	players[player_id] = Player.new(player_name)
	side_bar.add_player(players[player_id].player_name, player_id)
	
	send_message(player_id, "Welcome to the Game!")
	add_player_to_queue(player_id)
	
func add_player_to_queue(player_id: int):
	board_group_queue.append(player_id)
	print(board_group_queue)

func _start_game_with_check():
	# TODO Fix hard coded 4. It should be replaced with the number of players
	# on a board. 
	while len(board_group_queue) >= 4:
		var new_group = board_group_queue.slice(0, 4)
		if new_group.size() == 4:
			var board_players_still_active = true
			for id in new_group:
				if not players[id].active:
					board_players_still_active = false
					board_group_queue.erase(id)
			
			if board_players_still_active:
				start_game(new_group.duplicate()) # concurrency might be an issue?
				# TODO Is there a better way to do this?
				for id in new_group:
					board_group_queue.erase(id)

func _player_disconnected(player_id: int):
	#players[player_id].player_label.hide()
	if player_id in board_group_queue:
		board_group_queue.erase(player_id)

	players[player_id].active = false
	players[player_id].disconnect_time = Time.get_ticks_msec()
	side_bar.player_offline(player_id)

	if players[player_id].board_group >= 0: # In case this player wasn't part of a group
		game_over(players[player_id].board_group)


# TODO Check if the player is playing any games, send the boards, positions and current status
func _player_reconnected(player_id: int):
	side_bar.player_online(player_id)
	players[player_id].active = true
	GameServer.send_string(player_id, "Welcome back %s" % [players[player_id].player_name])
	add_player_to_queue(player_id)


func _receive_message(id, message):
	if id in players:
		_receive_player_message(id, message)
	elif id in observers:
		_receive_observer_message(id, message)

func _receive_observer_message(_observer_id, _message):
	pass

func _receive_player_message(player_id, message):
	#print("Received message from %s: %s. len=%s" % [player_id, message, len(message)])
	#print("Received message from %s: len=%s" % [player_id, len(message)])
	#print("	Part of group: %s" % players[player_id].board_group)
	if players[player_id].active == false:
		print_debug("Player is inactive, but sent a message!: ", player_id)
	var board_group_id = players[player_id].board_group
	
	if board_group_id < 0:
		print_debug("	Message received too early. ", board_group_id)
		return
	# If number of boards is the same as the message
	if len(board_groups[board_group_id]) == len(message):
		board_group_moves[players[player_id].board_group][player_id] = message
		if len(board_group_moves[players[player_id].board_group]) == 4:
			moves_received(players[player_id].board_group)
	else:
		lost_moves += 1
		print_rich("Lost move from [color=black]" + str(player_id) + ". Message = [color=red]" + message)
		$LostMoves.set_text("Lost moves: " + str(lost_moves))
		GameServer.send_string(player_id, "RESEND_MOVE")
	
	

func send_message(id, message):
	GameServer.send_string(id, message)


func moves_received(board_group_id: int):
	var players_in_group : Array[int] = []
	for player_id in board_group_moves[board_group_id]:
		players_in_group.append(player_id)
	
	var updated_player_positions : PackedByteArray = []
	for board_i: int in range(len(board_groups[board_group_id])):
		#print(board_i, board_group_id)
		var player_dict = board_group_moves[board_group_id].duplicate()
		for player_id in board_group_moves[board_group_id]:
			player_dict[player_id] = board_group_moves[board_group_id][player_id][board_i]
		
		board_groups[board_group_id][board_i].take_moves(player_dict)
		#if show_boards:
			#$BoardViewer.update_board(board_groups[board_group_id][board_i].get_scaled_image(image_scale), board_group_id, board_i)
		updated_player_positions += board_groups[board_group_id][board_i].get_serialized_player_number_positions()
	#_show_board(board_groups[0][0])
	#print(updated_player_positions)
	
	move_counter += (1.0 / len(board_groups))
	#var move_delta_string = "0"
	#var move_time_delta_average = 0
	if move_prev_time != 0:
		move_time_delta = Time.get_ticks_msec() - move_prev_time
		#move_time_delta_average = move_time_delta
	move_prev_time = Time.get_ticks_msec()
	move_counter_ui.set_text("Moves: " + str(round(move_counter)) + 
							 " - " + str(round((move_prev_time - time_start) / move_counter)) 
							 + " ms/frame")
	
	if board_groups[board_group_id][0].get_number_of_moves() >= moves_until_game_over:
		game_over(board_group_id)
	else:
		GameServer.send_data_to_group(players_in_group, updated_player_positions, true)
		#GameServer.send_string_to_group(players_in_group, "SEND_MOVES")
	
	board_group_moves[board_group_id].clear()
	
	

## Starts a game using the ids in [param players_list]. [br]
func start_game(players_list: Array[int]):
	var game_boards := await _generate_boards(number_of_boards_per_group)
	var player_setup: Dictionary = {}
	var player_names_dictionary : Dictionary = {}
	for i in range(players_list.size()): # TODO iterate over elements directly instead.
		player_setup[players_list[i]] = possible_colors[i]
		side_bar.update_player_color(players_list[i], possible_colors[i])
		player_names_dictionary[players_list[i]] = players[players_list[i]].player_name

	print("Player setup: ", player_setup)
	
	var serialized_boards : Array[PackedByteArray] = []
	var number_of_bytes := 4 # Number of boards, 4 bytes
	for game_board in game_boards:
		game_board.setup_players(player_setup)
		game_board.set_player_names(player_names_dictionary)
		var serialized_board = game_board.get_obstacle_serialized()
		var game_board_width_bytes : int = game_board.get_width()
		var game_board_height_bytes : int = game_board.get_height() 
		
		var serialized_with_prelude : PackedByteArray = []
		#print("Game board width bytes ", ceil(game_board_width_bytes / 8.0))
		serialized_with_prelude.append(game_board_width_bytes >> 8)
		serialized_with_prelude.append(game_board_width_bytes & 0xff)
		serialized_with_prelude.append(game_board_height_bytes >> 8)
		serialized_with_prelude.append(game_board_height_bytes & 0xff)
		serialized_with_prelude += serialized_board
		
		number_of_bytes += serialized_with_prelude.size()
		
		serialized_boards.append(serialized_with_prelude)
	
	print(number_of_bytes)
	var final_message : PackedByteArray = []
	for x in range(4):
		final_message.append((number_of_bytes >> (24 - x * 8)) & 0xff)
	
	for x in range(4):
		final_message.append((number_of_boards_per_group >> (24 - x * 8)) & 0xff)
	
	for serialized_board in serialized_boards:
		final_message += serialized_board
	print(final_message)
	var error = GameServer.send_string_to_group(players_list, "GAME_STARTING")
	if error != OK:
		print("Failed to send GAME_STARTING. Abort this game setup: ", players_list)
		for board in game_boards:
			board.queue_free()
		return
		
	
	GameServer.send_data_to_group(players_list, final_message)
	
	# Send player numbers to each member
	var player_positions_data : PackedByteArray = []
	for board in game_boards:
		player_positions_data += board.get_serialized_player_number_positions()
	print(player_positions_data)
	
	var player_position_num_of_bytes = player_positions_data.size()
	var player_positions_message : PackedByteArray = []
	for x in range(4):
		player_positions_message.append((player_position_num_of_bytes >> (24 - x * 8)) & 0xff)
	
	player_positions_message += player_positions_data
	GameServer.send_data_to_group(players_list, player_positions_message)
	
	var player_number = 1
	for player in players_list:
		var message : PackedByteArray = [0, 0, 0, 1, player_number]
		player_number += 1
		GameServer.send_data(player, message) 
	
	var next_board_group_id = board_group_id_latest + 1
	board_group_id_latest = next_board_group_id
	board_groups[next_board_group_id] = game_boards
	#board_groups.append(game_boards)
	
	# Send moves
	var group_moves : Dictionary = {}
	for player in players_list:
		players[player].board_group = next_board_group_id
	board_group_moves[next_board_group_id] = group_moves
	#board_group_moves.append(group_moves)
	
	GameServer.send_string_to_group(players_list, "SETUP_COMPLETE_SEND_MOVES")
	# Development purposes
	if show_boards:
		for board in game_boards:
			$BoardViewer.add_board(board.get_scaled_image(image_scale), len(board_groups)-1)
	time_start = Time.get_ticks_msec()

func game_over(board_group_id: int):
	# TODO: Gather statistics and add to the players
	# TODO: 
	if len(board_groups[board_group_id]) == 0 or not board_groups[board_group_id][0]:
		return
		
	for player_id in board_groups[board_group_id][0].player_colors:
		if players[player_id].active:
			GameServer.send_string(player_id, "GAME_OVER")
			
			add_player_to_queue(player_id)
	
	for board: Node in board_groups[board_group_id]:
		board.queue_free()
	board_groups[board_group_id].clear()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	##print(board_groups[0][0].count_colors())
	#pass
	#
#func _physics_process(delta):
	#pass
	
func _generate_boards(number_of_boards: int = 1) -> Array[Node2D]:
	var local_boards: Array[Node2D] = []
	var new_board_group := BOARD_VIEW_GROUP.instantiate()
	board_holder.add_child(new_board_group)
	for x in range(number_of_boards):
		var board = BOARD.instantiate()
		var width = max(min_board_width, randi() % max_board_width)
		var height = max(min_board_height, randi() % max_board_height)
		
		await board.generate_random_board(width, height)
		local_boards.append(board)

		new_board_group.add_board(board)
	
	if board_holder.get_child_count() > 1:
		var prev_board_pos = board_holder.get_children().back().position
		new_board_group.position = prev_board_pos + new_board_group.get_size()
		board_holder.arrange_children()
		
	
	return local_boards




# This is testing stuff
#var rounds = 50
#var current_round = 0
#func _on_game_tick_timeout():
	#if current_round < rounds:
		#for player_id in next_moves:
			#next_moves[player_id] = valid_moves.pick_random()
		#for board in boards:
			#board.take_moves(next_moves)
		#_after_ready()
	#else:
		#boards[current_board].history_playback_setup()
		#$GameTick.stop()
		#$HistoryTick.start()
	#current_round += 1
#
#
#func _on_history_tick_timeout():
	#if boards[current_board].history_playback_step():
		#$HistoryTick.stop()
	##print(boards[current_board].count_colors())
	#_after_ready()
           shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 main_color = COLOR;
	vec4 test_color = vec4(UV.r, UV.g, 0.0, 1.0);
	COLOR = mix(main_color, test_color, vec4(0.5, 0.5, 0.5, 1.0));
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
     RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script +   res://board_color_game/board_color_main.gd ��������   Script &   res://board_color_game/BoardViewer.gd ��������   PackedScene /   res://board_color_game/ui/sidebar/SideBar.tscn X��7�|8   Script &   res://board_color_game/BoardHolder.gd ��������      local://PackedScene_6awj0 �         PackedScene          	         names "   :      Main    script    number_of_boards_per_group    max_board_width    max_board_height    image_scale    moves_until_game_over    possible_colors    Node2D    PlayerList    offset_right    offset_bottom $   theme_override_constants/separation    VBoxContainer    PlayerListGrid    visible    columns    GridContainer    PlayerRichLabelTemplate    layout_mode    fit_content    autowrap_mode    RichTextLabel    PlayerLabel    Label 	   GameTick 
   wait_time 	   one_shot    Timer    HistoryTick 	   Sprite2D 	   position    BoardViewer    x_step    y_step 
   LostMoves    offset_left    offset_top    text    Camera    zoom 	   Camera2D    DebugLayer    CanvasLayer    CurrentBuffer    UI    SideBar    MoveCounter    BoardHolder    boards_per_row    BoardQueueTimer 
   autostart    _on_game_tick_timeout    timeout    _on_history_tick_timeout    _on_child_entered_tree    child_entered_tree    _start_game_with_check    	   variants    )                                  P�             �?          �?         �?      �?             �?  �?     �?��,?  �?  �?   ���>��?���>  �?   ��9?���>��s?  �?   r�>��?��0?  �?   ��(?��?��>  �?   ��Z?���>��\>  �?   ���>��?	�|>  �?   ��?��?���>  �?      B   ����          
                      )   h��|?5�?)   �������?
    �D  �C
     IC  �C            ,      @VD     �B    @nD     �B      Lost moves:  
     �B  �B
   ��L?��L?    ��C     A    �D     �B              0A     8C     �C    �D     �A     �B     �B      Moves:                 ?      node_count             nodes     �   ��������       ����                                                             	   ����   
                                    ����         
               	                    ����            
                                ����            
                     ����                                 ����                           ����                            ����               !      "                     #   ����         $      %      
            &                  )   '   ����         (                  +   *   ����                  ,   ����   $      %      
                        +   -   ����               ���.         $      %       
   !      "                 /   ����   $   #   %   $   
         %   &   &                  0   ����      '   1   	                  2   ����      (   3                conn_count             conns               5   4                     5   6                    8   7                     5   9                    node_paths              editable_instances              version             RSRC           RSRC                    NoiseTexture2D            ��������                                            (      resource_local_to_scene    resource_name    interpolation_mode    interpolation_color_space    offsets    colors    script    noise_type    seed 
   frequency    offset    fractal_type    fractal_octaves    fractal_lacunarity    fractal_gain    fractal_weighted_strength    fractal_ping_pong_strength    cellular_distance_function    cellular_jitter    cellular_return_type    domain_warp_enabled    domain_warp_type    domain_warp_amplitude    domain_warp_frequency    domain_warp_fractal_type    domain_warp_fractal_octaves    domain_warp_fractal_lacunarity    domain_warp_fractal_gain    width    height    invert    in_3d_space    generate_mipmaps 	   seamless    seamless_blend_skirt    as_normal_map    bump_strength 
   normalize    color_ramp    noise           local://Gradient_n4jii          local://FastNoiseLite_1kjic D         local://NoiseTexture2D_yaorf �      	   Gradient                !          &4y>         FastNoiseLite             	      O/=                  NoiseTexture2D                                &             '                  RSRC   RSRC                    PackedScene            ��������                                            )      resource_local_to_scene    resource_name    interpolation_mode    interpolation_color_space    offsets    colors    script    noise_type    seed 
   frequency    offset    fractal_type    fractal_octaves    fractal_lacunarity    fractal_gain    fractal_weighted_strength    fractal_ping_pong_strength    cellular_distance_function    cellular_jitter    cellular_return_type    domain_warp_enabled    domain_warp_type    domain_warp_amplitude    domain_warp_frequency    domain_warp_fractal_type    domain_warp_fractal_octaves    domain_warp_fractal_lacunarity    domain_warp_fractal_gain    width    height    invert    in_3d_space    generate_mipmaps 	   seamless    seamless_blend_skirt    as_normal_map    bump_strength 
   normalize    color_ramp    noise 	   _bundled           local://Gradient_n4jii ;         local://FastNoiseLite_1kjic t         local://NoiseTexture2D_wfsgp �         local://PackedScene_dph25       	   Gradient                !          &4y>         FastNoiseLite             	      O/=                  NoiseTexture2D                                &             '                     PackedScene    (      	         names "         NoiseTemplate    Node2D 	   Sprite2D    texture    	   variants                      node_count             nodes        ��������       ����                      ����                    conn_count              conns               node_paths              editable_instances              version             RSRC  ## This is a helper class for game_server. It was originally meant to be an 
## inner class, but there was something wrong with the doc generation
class_name Peer

var tcp_stream : StreamPeerTCP ## TCP client connection
var user_id : int ## User id. Nothing special. Most likely randomly generated
var user_name : String = "" ## User name. To be provided by the client
var time_of_connection : int
var last_message_time : int = 0

static func _create_peer(tcp_stream_inp: StreamPeerTCP, user_id_inp: int, user_name_inp: String, time_of_connection_inp: int) -> Peer:
	var new_peer = Peer.new()
	new_peer.tcp_stream = tcp_stream_inp
	new_peer.user_id = user_id_inp
	new_peer.user_name = user_name_inp
	new_peer.time_of_connection = time_of_connection_inp
	return new_peer
              ## This autoloaded script handles the TCP server and connection logic. [br]
## When a client tries to connect, they will be temporarily accepted whilst
## answering a question about user_id and name. There can be multiple clients
## with the same name. User IDs are unique. If a client requests a user id
## that is already occupied, the connection will be refused.

extends Node

@export_range(444, 65535) var PORT := 9080 ## TCP server port
@export var max_connections := 100 ## Max number of clients that can be connected at once
@export_range(500, 10000, 50) var heartbeat_timer_ms := 1000
var current_connections := 0

var used_user_ids = []

var server := TCPServer.new() ## TCP server which will be running

## A dictionary containing all peers currently connected.
## Will be of the format { peer_id: [Peer] }
var peers: Dictionary 

## Peers that have connected, but not registered themselves yet. 
## In order to register, we need a message specifying at least a name,
## and perhaps a user_id as well. [br]
## If the user_id exists in the [member disconnected_peers], assign this peer
## that user_id and move it to [member peers]. 
## If no user_id is provided, assign a random user_id
var non_registered_peers: Array[StreamPeerTCP]

## Pending TCP client connections. Once the initial TCP handshake
## is complete, the client will be moved over to [member non_registered_peers]
var pending_peers: Array[StreamPeerTCP] = []

## A dictionary containing the IDs of disconnected peers { peer_id: [Peer] }
var disconnected_peers: Dictionary 

var bytes_read := 0

signal peer_connected(id, user_name) ## Emitted when a client connects
signal peer_disconnected(id) ## Emitted when a client disconnects
signal peer_reconnected(id) ## Emitted when a client reconnects
signal peer_message_received(id, message)

@onready var server_status = $CanvasLayer/ServerStatus

func _ready():
	Performance.add_custom_monitor("Data received KB", get_number_of_bytes_read)
	pass


func get_number_of_bytes_read():
	var temp_bytes_read = bytes_read
	bytes_read = 0
	return temp_bytes_read / 1000

## Start the TCP server
func start():
	var result = server.listen(PORT)
	if result == 0:
		server_status.push_color(Color.GREEN)
		server_status.add_text("Server is online")
		server_status.push_color(Color.WHITE)
		server_status.add_text("\nListening on port: " + str(PORT))
		for address: String in IP.get_local_addresses():
			if address.begins_with("192") or address.begins_with("10"):
				server_status.add_text("\n" + address)
				
	else:
		server_status.push_color(Color.RED)
		server_status.add_text("Server is offline")
	return result

## Sends a message as a string in ASCII. [br]
## [param dict] can be changed to another dictionary, depending on which
## dictionary should be used, [member peers] or [member pending_peers]
func send_string(id: int, message: String, target_dict = peers):
	#print("Send string to: ", id, ", message = ", message)
	Logger.trace(3, "Sending message to " + str(id) + ": " + message)
	if id == 0:
		for peer: Peer in target_dict:
			peer.last_message_time = Time.get_ticks_msec()
			peer.tcp_stream.put_string(message)
	elif id in target_dict:
		target_dict[id].tcp_stream.put_string(message)

func send_string_to_group(ids: Array[int], message):
	var result = OK
	for id in ids:
		if id in peers:
			peers[id].last_message_time = Time.get_ticks_msec()
			peers[id].tcp_stream.put_string(message)
		else:
			print_debug("Id: ", id, " not in peers")
			result = FAILED
	return result

func send_data_to_group(ids: Array[int], data: PackedByteArray, add_prelude := false):
	#print("Send data to group")
	if add_prelude:
		var length_of_data = len(data)
		var prelude : PackedByteArray = []
		for x in range(4):
			prelude.append((length_of_data >> (24 - x * 8)) & 0xff)
		
		data = prelude + data
	
	var result = OK
	for id in ids:
		if id in peers:
			peers[id].last_message_time = Time.get_ticks_msec()
			peers[id].tcp_stream.put_data(data)
		else:
			print_debug("Id: ", id, " not in peers")
			result = FAILED
	return result

func receive_message(peer: Peer):
	peer.last_message_time = Time.get_ticks_msec()
	var available_data = peer.tcp_stream.get_available_bytes()
	bytes_read += available_data
	#print("Available data: ", available_data)
	var message = peer.tcp_stream.get_string(available_data)
	#print("	Receive message: ", peer.user_id, " message= ", message)
	#if message == "":
		#print("	Something went wrong with the packet from ", peer.user_id, ". Abort")
		#return
	peer_message_received.emit(peer.user_id, message)

func send_data(id: int, data: PackedByteArray):
	#print("Sending data")
	return send_data_to_group([id], data)

## Checks if a pending peer has established a connection. If it has, add it to 
## [member non_registered_peers].
## [br] If the connection fails, remove the connection.
## [br] Returns true if this pending_peer is done processing.
## [br] When the peer is successfully connected, send a message asking for 
## user id and name.
func _connect_pending_peer(pending_peer: StreamPeerTCP) -> bool:
	pending_peer.poll()
	match pending_peer.get_status():
		StreamPeerTCP.STATUS_CONNECTING:
			return false
		StreamPeerTCP.STATUS_CONNECTED:
			non_registered_peers.append(pending_peer)
			print("Adding peer to non_registered_peers")
			return true
		_:
			pending_peer.disconnect_from_host()
			return true

## Check if a peer is still connected
func _peer_still_connected(peer: StreamPeerTCP) -> bool:
	peer.poll()
	return peer.get_status() == StreamPeerTCP.STATUS_CONNECTED

## Finish up registring peer
func _complete_register_peer(peer: Peer) -> bool:
	if peer.user_id in peers:
		return false
	elif peer.user_id in disconnected_peers:
		peers[peer.user_id] = peer
		disconnected_peers.erase(peer.user_id)
		peer_reconnected.emit(peer.user_id)
		print("Peer has reconnected")
	else:
		peers[peer.user_id] = peer
		peer_connected.emit(peer.user_id, peer.user_name)
	return true

## Attempt to register a recently connected peer.
## [br] Checks if the peer has sent a "REGISTER:user_id=XXX,name=YYY,big_endian=Z"
## message.
func _register_peer(peer: StreamPeerTCP):
	#print("Checking if peer has registered")
	var message_buffer : PackedByteArray = []
	while peer.get_available_bytes() > 0:
		#print(peer.get_available_bytes())
		var message = peer.get_partial_data(100)
		message_buffer += message[1]
	
	if message_buffer:
		var message = message_buffer.get_string_from_ascii()
		print("Message: ", message)
		if not "user_id" in message:
			print("Missing user_id. Reject connection")
			return
		if not "name" in message:
			print("Missing name. Reject connection")
			return
		if not "big_endian" in message:
			print("Missing big_endian. Reject connection")
			return
		
		var regex = RegEx.new()
		regex.compile("\\d+")
		var user_id_ss = regex.search(message, message.find("user_id=") + 8)
		if not user_id_ss:
			return
		var user_id = user_id_ss.get_string() as int
		if user_id < 100 or user_id > pow(2, 31):
			return
		print("User id: ", user_id, " X")
		
		regex.compile("(\\d|-|\\w+)+")
		var user_name = regex.search(message, message.find("name=") + 4)
		if not user_name:
			return

		regex.compile(".")
		var big_endian = regex.search(message, message.find("big_endian=") + 11)
		if not big_endian:
			big_endian = 1
		peer.set_big_endian(big_endian.get_string() as int as bool)
		
		var new_peer := Peer._create_peer(peer, user_id, user_name.get_string(), Time.get_ticks_msec())
		if not _complete_register_peer(new_peer):
			new_peer.tcp_stream.put_string("NOK")
		else:
			pass
			# new_peer.tcp_stream.put_string("OK") # TODO: Maybe we don't need this
			
		return true

	return false

func _process(_delta):
	## Check if there are any new connections available. 
	while current_connections <= max_connections and server.is_connection_available():
		var new_client: StreamPeerTCP = server.take_connection()
		pending_peers.append(new_client)
		
	var pending_peers_to_remove = []
	for pending_peer: StreamPeerTCP in pending_peers:
		if _connect_pending_peer(pending_peer):
			print("Peer connected successfully")
			pending_peers_to_remove.append(pending_peer)
	for pending_peer in pending_peers_to_remove:
		pending_peers.erase(pending_peer)
	
	var newly_registered_peers = []
	for peer in non_registered_peers:
		if _register_peer(peer):
			newly_registered_peers.append(peer)
	for peer in newly_registered_peers:
		non_registered_peers.erase(peer)
	
	var peers_to_remove = []
	for peer_id in peers:
		# Check state of connection
		#print("Peer status: ", peers[peer_id].tcp_stream.get_status())
		peers[peer_id].tcp_stream.poll()
		#print("Peer: ", peer_id, " - ", peers[peer_id].tcp_stream.get_available_bytes())
		if peers[peer_id].tcp_stream.get_status() != StreamPeerTCP.STATUS_CONNECTED:
			peers_to_remove.append(peer_id)
			print("Peer has disconnected")
		elif peers[peer_id].tcp_stream.get_available_bytes() > 0:
			#print("Peer has a message!")
			receive_message(peers[peer_id])

	
	for peer_id in peers_to_remove:
		disconnected_peers[peer_id] = peers[peer_id]
		#print("Trying to erase peer_id ", peer_id, " from peers")
		peer_disconnected.emit(peer_id)
		peers.erase(peer_id)
	
	#if print_counter == print_interval:
		#print("peers: ", peers)
		#print("\tdisconnected peers: ", disconnected_peers)
		#print_counter = 0
	#
	#print_counter += 1


func _on_heart_beat_timer_timeout():
	var current_time = Time.get_ticks_msec()
	for peer in peers:
		if current_time - peers[peer].last_message_time > heartbeat_timer_ms:
			send_string(peer, "HEARTBEAT")
          RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script !   res://game_server/game_server.gd ��������      local://PackedScene_a86al          PackedScene          	         names "         GameServer    script    PORT    heartbeat_timer_ms    Node    HeartBeatTimer 
   autostart    Timer    CanvasLayer    ServerStatus    offset_right    offset_bottom    focus_mode    selection_enabled    RichTextLabel    _on_heart_beat_timer_timeout    timeout    	   variants                    w#     '             �C     �B            node_count             nodes     ,   ��������       ����                                        ����                           ����                  	   ����   
                                  conn_count             conns                                      node_paths              editable_instances              version             RSRC       extends Node


@export var trace_level := 5

func trace(level, text):
	if level >= trace_level:
		print(text)
  RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://logger/Logger.gd ��������      local://PackedScene_bx35n          PackedScene          	         names "         Logger    script    trace_level    Node    	   variants                             node_count             nodes        ��������       ����                          conn_count              conns               node_paths              editable_instances              version             RSRC[remap]

importer="texture"
type="PlaceholderTexture2D"
uid="uid://cuc8l48hq5hwq"
metadata={
"vram_texture": false
}
path="res://.godot/exported/3092355210/export-218a8f2b3041327d8a5756f3a245f83b-icon.res"
  RSRC                    PlaceholderTexture2D            ��������                                                  resource_local_to_scene    resource_name    size    script        #   local://PlaceholderTexture2D_bjj4o �          PlaceholderTexture2D       
      C   C      RSRC         [remap]

importer="texture"
type="PlaceholderTexture2D"
uid="uid://diwihk3pfvldb"
metadata={
"vram_texture": false
}
path="res://.godot/exported/3092355210/export-4bb5dece302433d92a561b98178658d4-xx.res"
    RSRC                    PlaceholderTexture2D            ��������                                                  resource_local_to_scene    resource_name    size    script        #   local://PlaceholderTexture2D_hkogx �          PlaceholderTexture2D       
      D  �C      RSRC         [remap]

path="res://.godot/exported/3092355210/export-35a6b345bcd6ad58c715b11096febeab-board.scn"
             [remap]

path="res://.godot/exported/3092355210/export-5218b375685b1269c845d916c88c6b00-board_stats.scn"
       [remap]

path="res://.godot/exported/3092355210/export-bb0137dabe60e5fd08691157c1308e51-board_view_group.scn"
  [remap]

path="res://.godot/exported/3092355210/export-7e1d5d1f520910cfebc408bc0ae5240c-SideBar.scn"
           [remap]

path="res://.godot/exported/3092355210/export-19418c3edf9a3d188c8320c73219b7e9-SideBarItem.scn"
       [remap]

path="res://.godot/exported/3092355210/export-20f44b057545b4cb9a315e5d8c343b0c-board_color_main.scn"
  [remap]

path="res://.godot/exported/3092355210/export-b6f8418e97da2a6a62ec57a1b3ca46ea-new_noise_texture_2d.res"
              [remap]

path="res://.godot/exported/3092355210/export-abeb4403404b8119260690a3c43affbf-noise_template.scn"
    [remap]

path="res://.godot/exported/3092355210/export-3854d556faed144f539f1f683a06d74e-game_server.scn"
       [remap]

path="res://.godot/exported/3092355210/export-865311ccd3f9fa3ad49b591c5d8de441-Logger.scn"
            list=Array[Dictionary]([{
"base": &"RefCounted",
"class": &"Board",
"icon": "",
"language": &"GDScript",
"path": "res://board_color_game/board.gd"
}, {
"base": &"RefCounted",
"class": &"Peer",
"icon": "",
"language": &"GDScript",
"path": "res://game_server/helper_classes/peer_class.gd"
}, {
"base": &"ScrollContainer",
"class": &"SideBarBoard",
"icon": "",
"language": &"GDScript",
"path": "res://board_color_game/ui/sidebar/SideBar.gd"
}, {
"base": &"PanelContainer",
"class": &"SideBarItemBoard",
"icon": "",
"language": &"GDScript",
"path": "res://board_color_game/ui/sidebar/SideBarItem.gd"
}])
        <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             '<�Z���'   res://board_color_game/board/board.tscnY�AՏ<-   res://board_color_game/board/board_stats.tscn �01th2   res://board_color_game/board/board_view_group.tscna����<O7   res://board_color_game/ui/dungeon_tiles/basic_floor.pngT����[?   res://board_color_game/ui/dungeon_tiles/basic_floor_texture.pngX��7�|8.   res://board_color_game/ui/sidebar/SideBar.tscn���.� 2   res://board_color_game/ui/sidebar/SideBarItem.tscn��r �	,   res://board_color_game/board_color_main.tscn������?0   res://board_color_game/new_noise_texture_2d.tres!�����H*   res://board_color_game/noise_template.tscn��ȭ��8"   res://game_server/game_server.tscn%��D��)   res://logger/Logger.tscn(�#C��U   res://icon.svgkQI����k   res://xx.png              ECFG      _custom_features         dedicated_server   application/config/name         TCPGameServer      application/run/main_scene4      ,   res://board_color_game/board_color_main.tscn   application/config/features$   "         4.2    Forward Plus       application/config/icon         res://icon.svg     autoload/GameServer,      #   *res://game_server/game_server.tscn    autoload/Logger$         *res://logger/Logger.tscn      display/window/vsync/vsync_mode             editor_plugins/enabled0   "      !   res://addons/chart_2d/plugin.cfg        file_customization/folder_colors8               res://board_color_game/ui/        pink   input/W�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode    w      echo          script         input/A�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   A   	   key_label             unicode    a      echo          script         input/S�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode    s      echo          script         input/D�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   D   	   key_label             unicode    d      echo          script         input/CameraPan�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script         input/CameraZoomIn�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script         input/CameraZoomOut�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script         input/DragWindow�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script                    