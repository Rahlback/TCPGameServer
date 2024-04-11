GDPC                �	                                                                         X   res://.godot/exported/133200997/export-19418c3edf9a3d188c8320c73219b7e9-SideBarItem.scn @      �      ����B���E]P�    \   res://.godot/exported/133200997/export-20f44b057545b4cb9a315e5d8c343b0c-board_color_main.scn            ����n����C:J�    X   res://.godot/exported/133200997/export-3854d556faed144f539f1f683a06d74e-game_server.scn ��      <      ���n��x�a	���c�)    T   res://.godot/exported/133200997/export-7e1d5d1f520910cfebc408bc0ae5240c-SideBar.scn �      �      g� ��`R���B	��    \   res://.godot/exported/133200997/export-abeb4403404b8119260690a3c43affbf-noise_template.scn   �      �      ���l)�㿋���Q    `   res://.godot/exported/133200997/export-b6f8418e97da2a6a62ec57a1b3ca46ea-new_noise_texture_2d.res0�      �      핧Px���x#�~��    ,   res://.godot/global_script_class_cache.cfg  @�      X      ���=�� ����    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  `�      n      ���(��悦�P�һ�    (   res://board_color_game/BoardViewer.gd    J      �      ֮��BT@Lg|��$�        res://board_color_game/board.gd       6      �v��3qՍ:�Տ�    ,   res://board_color_game/board_color_main.gd  �N      �.      -��#m�dn�z)�(�    0   res://board_color_game/board_color_main.gdshader`}      �      ����u�-��6    4   res://board_color_game/board_color_main.tscn.remap  p�      m       �4���i�P����    8   res://board_color_game/new_noise_texture_2d.tres.remap  ��      q       �L����FU��U+w��    0   res://board_color_game/noise_template.tscn.remap`�      k       s�S�
ZsG�*&�w    ,   res://board_color_game/ui/sidebar/SideBar.gd        �      �B�ҙ����9,xsIL    4   res://board_color_game/ui/sidebar/SideBar.tscn.remap��      d       h��X%��,�]e��e    0   res://board_color_game/ui/sidebar/SideBarItem.gd�
      �      ⺃�H��
|�۶��    8   res://board_color_game/ui/sidebar/SideBarItem.tscn.remap �      h       &c@����
w�W��        res://game_server/game_server.gd��      �!       oP�Zjz)�5����    (   res://game_server/game_server.tscn.remap��      h       ��K���+��\X�    0   res://game_server/helper_classes/peer_class.gd  Е      �      ���ߝ�����I��=k       res://icon.svg  ��      �      C��=U���^Qu��U3       res://icon.svg.import   ��      �       2r���b`������bN�       res://project.binary��      9      �L�4v�с4��X_��            extends ScrollContainer

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
	
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script -   res://board_color_game/ui/sidebar/SideBar.gd ��������      local://PackedScene_t5gnt $         PackedScene          	         names "         SideBar    offset_left    offset_top    offset_right    offset_bottom    size_flags_horizontal    size_flags_vertical    mouse_filter    script    player_color    player_offline_color    ScrollContainer    ItemBox    layout_mode    VBoxContainer    _on_mouse_entered    mouse_entered    _on_mouse_exited    mouse_exited    	   variants    
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
   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name    content_margin_left    content_margin_top    content_margin_right    content_margin_bottom 	   bg_color    draw_center    skew    border_width_left    border_width_top    border_width_right    border_width_bottom    border_color    border_blend    corner_radius_top_left    corner_radius_top_right    corner_radius_bottom_right    corner_radius_bottom_left    corner_detail    expand_margin_left    expand_margin_top    expand_margin_right    expand_margin_bottom    shadow_color    shadow_size    shadow_offset    anti_aliasing    anti_aliasing_size    script 	   _bundled       Script 1   res://board_color_game/ui/sidebar/SideBarItem.gd ��������      local://StyleBoxFlat_b15yj �         local://PackedScene_a8y5e �         StyleBoxFlat    	                  PackedScene          	         names "         SideBarItem    custom_minimum_size    offset_right    offset_bottom    mouse_filter    script    PanelContainer    HBox    layout_mode    HBoxContainer    PlayerName    size_flags_horizontal    text    fit_content    RichTextLabel    VSeparator    visible     theme_override_styles/separator    ConnectionStatus    scroll_active    	   variants    
   
     aC         aC     �A                            PlayerName                              node_count             nodes     M   ��������       ����                                              	      ����                             
   ����                                                  ����                        	                    ����                                           conn_count              conns               node_paths              editable_instances              version             RSRC       ## A game board. Width and height always needs to be even, if an odd width or
## height is supplied it will be rounded up to the nearest even number.
## [br]
## The board itself is stored as an image.
## [br]
## A player can move if the following conditions are met
## [br]
## 1. The space is not a wall [br]
## 2. Another player is not moving into the same position [br]
## 3. Another player is not occupying the space. This can happen if a player becomes stuck.
class_name Board

@export var default_width_min = 10
@export var default_width_max = 100
@export var default_height_min = 10
@export var default_height_max = 100
@export var number_of_seeds = 3000

const NOISE_TEMPLATE = preload("res://board_color_game/noise_template.tscn")
const NEW_NOISE_TEXTURE_2D = preload("res://board_color_game/new_noise_texture_2d.tres")

var player_colors : Dictionary ## {player_id: Color}
var player_positions : Dictionary ## {player_id: Vector2i}
var player_numbers : Dictionary
var rev_player_numbers : Dictionary

var board : Image
var starting_board : Image

var cached_image_scale : int = -1
var cached_scaled_image : Image = Image.new()

var obstacles_serialized : PackedByteArray

var starting_positions : Array[Vector2i]
var movement = {"U": Vector2i(0, -1), "L": Vector2i(-1, 0),
				"R": Vector2i(1, 0),  "D": Vector2i(0, 1)}

var history : Array[HistoryItem] ## {
var current_history_step = 0

class HistoryItem:
	var player_positions # [{player_id: pos, player_id: pos, ...}]

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
		starting_positions.append(player_pos)
		starting_positions.append(Vector2i(player_pos.x, height - 1 - player_pos.y))
		starting_positions.append(Vector2i(width - 1 - player_pos.x, player_pos.y))
		starting_positions.append(Vector2i(width - 1 - player_pos.x, height - 1 - player_pos.y))

	return board


## Setup players. Will assign start positions to each player and save colors.
## Should be called after generating a board
## [br]. players = {player_id: Color}
func setup_players(players: Dictionary):
	if not board:
		return
	player_colors = players
	
	var current_start_pos = 0
	for player_id in players:
		player_positions[player_id] = starting_positions[current_start_pos]
		board.set_pixelv(player_positions[player_id], player_colors[player_id])
		current_start_pos += 1
		player_numbers[player_id] = current_start_pos
		rev_player_numbers[current_start_pos] = player_id
	
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
func get_scaled_image(scale: int = 5):
	if cached_image_scale == scale:
		return _get_cached_scaled_image(scale)
	
	var scaled_image = Image.create(board.get_width() * scale, 
									board.get_height() * scale, false, Image.FORMAT_RGBA8)
	
	var scaled_pixel = Image.create(scale, scale, false, Image.FORMAT_RGBA8)
	var scaled_pixel_rect = Rect2i(0, 0, scale, scale)
	for y in board.get_height():
		for x in board.get_width():
			scaled_pixel.fill(board.get_pixel(x, y))
			scaled_image.blit_rect(scaled_pixel, scaled_pixel_rect, Vector2i(x * scale, y * scale))
	
	var player_rect = Rect2i(0, 0, scale/2, scale/2)
	var player_image = Image.create(scale/2, scale/2, false, Image.FORMAT_RGBA8)
	player_image.fill(Color.CORAL)
	for player_id in player_positions:
		var pos = player_positions[player_id] * scale
		pos += Vector2i(scale/4, scale/4)
		scaled_image.blit_rect(player_image, player_rect, pos)
		
	cached_image_scale = scale
	cached_scaled_image.copy_from(scaled_image)
	return scaled_image

func _get_cached_scaled_image(scale: int = 5):
	var scaled_pixel = Image.create(scale, scale, false, Image.FORMAT_RGBA8)
	var scaled_pixel_rect = Rect2i(0, 0, scale, scale)
	
	for player_id in player_colors:
		var pos = player_positions[player_id] * scale
		scaled_pixel.fill(player_colors[player_id])
		cached_scaled_image.blit_rect(scaled_pixel, scaled_pixel_rect, Vector2i(pos[0], pos[1]))
	
	var scaled_image = Image.new()
	scaled_image.copy_from(cached_scaled_image)
								
	var player_rect = Rect2i(0, 0, scale/2, scale/2)
	var player_image = Image.create(scale/2, scale/2, false, Image.FORMAT_RGBA8)
	player_image.fill(Color.CORAL)
	for player_id in player_positions:
		var pos = player_positions[player_id] * scale
		pos += Vector2i(scale/4, scale/4)
		scaled_image.blit_rect(player_image, player_rect, pos)
	return scaled_image

## Returns true if the colors are the same
func compare_colors(a: Color, b: Color):
	return a.r == b.r and a.g == b.g and a.b == b.b


func is_wall(pos: Vector2i):
	return compare_colors(board.get_pixelv(pos), Color.BLACK)

func is_oob(pos: Vector2i):
	var oob = pos.x < 0 or pos.x >= board.get_width()
	oob = oob or (pos.y < 0 or pos.y >= board.get_height())
	return oob

## Simulates the next step. Returns a list of new player positions. [br]
## player_moves = {player_id: "X"}
func take_moves(player_moves: Dictionary, save_history := false):
	var next_player_pos: Dictionary # {player_id: Vector2i}
	var desired_next_pos: Dictionary # {Vector2i: player_id}
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
		board.set_pixelv(next_player_pos[player_id], player_colors[player_id])
		player_positions[player_id] = next_player_pos[player_id]
		
	if save_history:
		var history_item = HistoryItem.new()
		history_item.player_positions = player_positions.duplicate(true)
		history.append(history_item)

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
	var colors: Dictionary
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
	# width = 15
	var bytes_per_row = ceil(board.get_width() / 8.0) # Get number 
	var bits_per_row = board.get_width()
	var num_of_rows = board.get_height()
	
	var pixel_data = board.get_data()
	var simple_data: Array[int]
	var current_num := 0
	
	var byte_offset = 0
	var current_byte := 0
	var number_of_bits := 0
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
	
# TODO
# Function to get updated state of the board 
# Save history of the players? In order to be able to repeat it.
# Maybe just have an observer instead?
# Maybe if there is a flag so that the memory consumption isn't too high

          extends Node2D

@export var x_step := 100
@export var y_step := 100

var x_offset = 0
var y_offset = 0

var switch_row_tracker : int = 0

var board_groups : Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
	board_groups[board_group][index].set_texture(ImageTexture.create_from_image(new_image))

               extends Node2D

@export_category("Multiplayer boards")
@export var number_of_simultaneous_games := 10
@export var number_of_boards_per_group := 100
@export var max_board_width := 15
@export var max_board_height := 15
@export var image_scale := 5

@export_group("Player colors")
@export var possible_colors: Array[Color]

@export_group("Debug")
@export var show_boards := true


var players : Dictionary
var observers : Dictionary # {observer_id: bool active}
var board_template = preload("res://board_color_game/board.gd")
var board_groups = []
var board_group_queue: Array[int]

var board_group_moves = []

var boards : Array[Board] = []
const number_of_players_on_board = 4

var move_counter := 0.0
var move_prev_time := 0
var move_time_delta := 0
var time_start := 0

var zoom := Vector2(1, 1)

# Onready items
@onready var side_bar = $UI/SideBar


# debug
var lost_moves = 0 

class Player:
	var player_name : String
	var active : bool
	var player_label : RichTextLabel = null # Potentially remove?
	var disconnect_time : int = 0
	var observers : Array[int] # A list of all observers
	var board_group : int = -1

	func _init(player_name: String):
		self.player_name = player_name
		self.active = true

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	GameServer.peer_connected.connect(_player_connected)
	GameServer.peer_disconnected.connect(_player_disconnected)
	GameServer.peer_reconnected.connect(_player_reconnected)
	GameServer.peer_message_received.connect(_receive_message)
	GameServer.start()
	
	#var b = await _generate_boards()
	#var b = board_template.new()
	#await b.generate_random_board(18, 5)
	#b.setup_players(players_test)
	#_show_board(b)
	#print(b.get_obstacle_serialized())
	

var players_test = {10: Color.CADET_BLUE, 11: Color.CHARTREUSE, 12: Color.YELLOW_GREEN, 13: Color.WEB_MAROON}

# This is for testing
var current_board = 0
func _after_ready():
	var gen_start_time = Time.get_ticks_msec()
	$Sprite2D.set_texture(ImageTexture.create_from_image(boards[current_board].get_scaled_image(20)))
	#print("Time to scale image: ", Time.get_ticks_msec() - gen_start_time, " ms")

func _show_board(board_group: int, board_index: int):
	$BoardViewer.update_board(board_groups[board_index].get_scaled_image(image_scale), board_index)
	#$Sprite2D.set_texture(ImageTexture.create_from_image(board.get_scaled_image(25)))

# This is for testing
var next_moves = {10: "R", 12: "L", 11: "R", 13: "L"}
var valid_moves = ["R", "L", "U", "D"]

func _unhandled_input(event):
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
		
	if len(board_groups) > 0:
		if event.is_action_pressed("D"):
			game_board_index = (game_board_index + 1) % len(board_groups[board_group_index])
		if event.is_action_pressed("S"):
			board_group_index = (board_group_index + 1) % len(board_groups)
		#_show_board(board_group_index, game_board_index)

var board_group_index = 0

func _player_connected(player_id: int, player_name: String):
	if player_name == "observer":
		#observers.append(player_id)
		print("Observer connected. Don't really do anything")
		return
	print("Player connected: %s %s" % [player_id, player_name])
	players[player_id] = Player.new(player_name)
	#var new_label : RichTextLabel = $PlayerListGrid/PlayerRichLabelTemplate.duplicate(0)
	#new_label.set_text(players[player_id].player_name)
	#new_label.show()
	#$PlayerListGrid.add_child(new_label)
	#players[player_id].player_label = new_label
	#
	side_bar.add_player(players[player_id].player_name, player_id)
	
	
	send_message(player_id, "Welcome to the Game!")
	board_group_queue.append(player_id)
	print(board_group_queue)
	
	if board_group_queue.size() == number_of_players_on_board:
		var board_players_still_active = true
		for id in board_group_queue:
			if not players[id].active:
				board_players_still_active = false
				board_group_queue.erase(id)
		
		if board_players_still_active:
			start_game(board_group_queue.duplicate()) # concurrency might be an issue?
			board_group_queue.clear()
	
	

func _player_disconnected(player_id: int):
	#players[player_id].player_label.hide()
	players[player_id].active = false
	players[player_id].disconnect_time = Time.get_ticks_msec()
	side_bar.player_offline(player_id)
	return
	players[player_id].player_label.clear()
	players[player_id].player_label.push_color(Color.RED)
	players[player_id].player_label.add_text(players[player_id].player_name)

# TODO Check if the player is playing any games, send the boards, positions and current status
func _player_reconnected(player_id: int):
	side_bar.player_online(player_id)
	players[player_id].active = true
	GameServer.send_string(player_id, "Welcome back %s" % [players[player_id].player_name])


func _receive_message(id, message):
	if id in players:
		_receive_player_message(id, message)
	elif id in observers:
		_receive_observer_message(id, message)

func _receive_observer_message(observer_id, message):
	pass

func _receive_player_message(player_id, message):
	#print("Received message from %s: %s. len=%s" % [player_id, message, len(message)])
	#print("Received message from %s: len=%s" % [player_id, len(message)])
	#print("	Part of group: %s" % players[player_id].board_group)
	
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
		$LostMoves.set_text("Lost moves: " + str(lost_moves))
		GameServer.send_string(player_id, "RESEND_MOVE")
	
	

func send_message(id, message):
	GameServer.send_string(id, message)


func moves_received(board_group_id: int):
	var players_in_group : Array[int]
	for player_id in board_group_moves[board_group_id]:
		players_in_group.append(player_id)
	
	var updated_player_positions : PackedByteArray = []
	for board_i: int in range(len(board_groups[board_group_id])):
		#print(board_i, board_group_id)
		var player_dict = board_group_moves[board_group_id].duplicate()
		for player_id in board_group_moves[board_group_id]:
			player_dict[player_id] = board_group_moves[board_group_id][player_id][board_i]
		
		board_groups[board_group_id][board_i].take_moves(player_dict)
		if show_boards:
			$BoardViewer.update_board(board_groups[board_group_id][board_i].get_scaled_image(image_scale), board_group_id, board_i)
		updated_player_positions += board_groups[board_group_id][board_i].get_serialized_player_number_positions()
	#_show_board(board_groups[0][0])
	#print(updated_player_positions)
	GameServer.send_data_to_group(players_in_group, updated_player_positions, true)
	GameServer.send_string_to_group(players_in_group, "SEND_MOVES")
	board_group_moves[board_group_id].clear()
	
	move_counter += (1.0 / len(board_groups))
	var move_delta_string = "0"
	var move_time_delta_average = 0
	if move_prev_time != 0:
		move_time_delta = Time.get_ticks_msec() - move_prev_time
		move_time_delta_average = move_time_delta
	move_prev_time = Time.get_ticks_msec()
	$MoveCounter.set_text("Moves: " + str(round(move_counter)) + " - " + str(round((move_prev_time - time_start) / move_counter)) + " ms/frame")
	

## Starts a game using the ids in [param players_list]. [br]
var game_board_index = 0
func start_game(players_list: Array[int]):
	var game_boards := await _generate_boards(number_of_boards_per_group)
	var player_setup: Dictionary
	
	for i in range(players_list.size()):
		player_setup[players_list[i]] = possible_colors[i]
	print("Player setup: ", player_setup)
	
	var serialized_boards : Array[PackedByteArray]
	var number_of_bytes := 4 # Number of boards, 4 bytes
	for game_board in game_boards:
		game_board.setup_players(player_setup)
		var serialized_board = game_board.get_obstacle_serialized()
		var game_board_width_bytes : int = game_board.get_width()
		var game_board_height_bytes : int = game_board.get_height() 
		
		var serialized_with_prelude : PackedByteArray
		print("Game board width bytes ", game_board_width_bytes >> 8)
		serialized_with_prelude.append(game_board_width_bytes >> 8)
		serialized_with_prelude.append(game_board_width_bytes & 0xff)
		serialized_with_prelude.append(game_board_height_bytes >> 8)
		serialized_with_prelude.append(game_board_height_bytes & 0xff)
		serialized_with_prelude += serialized_board
		
		number_of_bytes += serialized_with_prelude.size()
		
		serialized_boards.append(serialized_with_prelude)
	
	print(number_of_bytes)
	var final_message : PackedByteArray
	for x in range(4):
		final_message.append((number_of_bytes >> (24 - x * 8)) & 0xff)
	
	for x in range(4):
		final_message.append((number_of_boards_per_group >> (24 - x * 8)) & 0xff)
	
	for serialized_board in serialized_boards:
		final_message += serialized_board
	print(final_message)
	var error = GameServer.send_string_to_group(players_list, "GAME_STARTING")
	if error != OK:
		print("Failed to send GAME_STARTING")
	
	GameServer.send_data_to_group(players_list, final_message)
	
	# Send player numbers to each member
	var player_positions_data : PackedByteArray
	for board in game_boards:
		player_positions_data += board.get_serialized_player_number_positions()
	print(player_positions_data)
	
	var player_position_num_of_bytes = player_positions_data.size()
	var player_positions_message : PackedByteArray
	for x in range(4):
		player_positions_message.append((player_position_num_of_bytes >> (24 - x * 8)) & 0xff)
	
	player_positions_message += player_positions_data
	GameServer.send_data_to_group(players_list, player_positions_message)
	
	var player_number = 1
	for player in players_list:
		var message : PackedByteArray = [0, 0, 0, 1, player_number]
		player_number += 1
		GameServer.send_data(player, message) 
	
	board_groups.append(game_boards)
	
	# Send moves
	var group_moves : Dictionary
	for player in players_list:
		players[player].board_group = len(board_groups)-1
	board_group_moves.append(group_moves)
	
	GameServer.send_string_to_group(players_list, "SETUP_COMPLETE_SEND_MOVES")
	# Development purposes
	if show_boards:
		for board in game_boards:
			$BoardViewer.add_board(board.get_scaled_image(image_scale), len(board_groups)-1)
	#_show_board(game_boards[game_board_index])
	time_start = Time.get_ticks_msec()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _physics_process(delta):
	pass
	
func _generate_boards(number_of_boards: int = 1) -> Array[Board]:
	var local_boards: Array[Board]
	for x in range(number_of_boards):
		var size = 0
		var board: Board = board_template.new()
		var width = 5 + randi() % max_board_width
		var height = 5 + randi() % max_board_height
		
		await board.generate_random_board(width, height)
		local_boards.append(board)
	return local_boards




# This is testing stuff
var rounds = 50
var current_round = 0
func _on_game_tick_timeout():
	if current_round < rounds:
		for player_id in next_moves:
			next_moves[player_id] = valid_moves.pick_random()
		for board in boards:
			board.take_moves(next_moves)
		_after_ready()
	else:
		boards[current_board].history_playback_setup()
		$GameTick.stop()
		$HistoryTick.start()
	current_round += 1


func _on_history_tick_timeout():
	if boards[current_board].history_playback_step():
		$HistoryTick.stop()
	#print(boards[current_board].count_colors())
	_after_ready()
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
     RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script +   res://board_color_game/board_color_main.gd ��������   Script &   res://board_color_game/BoardViewer.gd ��������   PackedScene /   res://board_color_game/ui/sidebar/SideBar.tscn X��7�|8      local://PackedScene_7edxe �         PackedScene          	         names "   /      Main    script    number_of_boards_per_group    image_scale    possible_colors    Node2D    PlayerList    offset_right    offset_bottom $   theme_override_constants/separation    VBoxContainer    PlayerListGrid    visible    columns    GridContainer    PlayerRichLabelTemplate    layout_mode    fit_content    autowrap_mode    RichTextLabel    PlayerLabel    Label 	   GameTick 
   wait_time 	   one_shot    Timer    HistoryTick 	   Sprite2D 	   position    BoardViewer    x_step    y_step    MoveCounter    offset_left    offset_top    text    Camera 	   Camera2D 
   LostMoves    DebugLayer    CanvasLayer    CurrentBuffer    UI    SideBar    _on_game_tick_timeout    timeout    _on_history_tick_timeout    	   variants    "                                    �?          �?         �?      �?             �?  �?   ��9?���>��s?  �?   ��j?    ���>  �?   r�>��?��0?  �?   ��(?��?��>  �?   ��Z?���>��\>  �?   ���>��?	�|>  �?   ��?��?���>  �?   ���>��?���>  �?      B   ����          
                      )   h��|?5�?)   �������?
    �D  �C
     IC  �C            ,       �A     �B     hB     �B      Moves:  
    @D ��C    @VD     �B    @nD     �B      Lost moves:       �A              0A     8C     �C    �D      node_count             nodes     �   ��������       ����                                        
      ����               	                        ����                                            ����                  	      
                    ����                                 ����            	                     ����                           ����                           ����                                              ����   !      "                  #                  %   $   ����                        &   ����   !      "                  #                  (   '   ����                  )   ����                           (   *   ����               ���+         !      "                !             conn_count             conns               -   ,                     -   .                    node_paths              editable_instances              version             RSRC              RSRC                    NoiseTexture2D            ��������                                            (      resource_local_to_scene    resource_name    interpolation_mode    interpolation_color_space    offsets    colors    script    noise_type    seed 
   frequency    offset    fractal_type    fractal_octaves    fractal_lacunarity    fractal_gain    fractal_weighted_strength    fractal_ping_pong_strength    cellular_distance_function    cellular_jitter    cellular_return_type    domain_warp_enabled    domain_warp_type    domain_warp_amplitude    domain_warp_frequency    domain_warp_fractal_type    domain_warp_fractal_octaves    domain_warp_fractal_lacunarity    domain_warp_fractal_gain    width    height    invert    in_3d_space    generate_mipmaps 	   seamless    seamless_blend_skirt    as_normal_map    bump_strength 
   normalize    color_ramp    noise           local://Gradient_n4jii          local://FastNoiseLite_1kjic D         local://NoiseTexture2D_rcimc �      	   Gradient                !          &4y>         FastNoiseLite             	      O/=                  NoiseTexture2D                                &             '                  RSRC   RSRC                    PackedScene            ��������                                            )      resource_local_to_scene    resource_name    interpolation_mode    interpolation_color_space    offsets    colors    script    noise_type    seed 
   frequency    offset    fractal_type    fractal_octaves    fractal_lacunarity    fractal_gain    fractal_weighted_strength    fractal_ping_pong_strength    cellular_distance_function    cellular_jitter    cellular_return_type    domain_warp_enabled    domain_warp_type    domain_warp_amplitude    domain_warp_frequency    domain_warp_fractal_type    domain_warp_fractal_octaves    domain_warp_fractal_lacunarity    domain_warp_fractal_gain    width    height    invert    in_3d_space    generate_mipmaps 	   seamless    seamless_blend_skirt    as_normal_map    bump_strength 
   normalize    color_ramp    noise 	   _bundled           local://Gradient_n4jii ;         local://FastNoiseLite_1kjic t         local://NoiseTexture2D_ddb5r �         local://PackedScene_3p53i       	   Gradient                !          &4y>         FastNoiseLite             	      O/=                  NoiseTexture2D                                &             '                     PackedScene    (      	         names "         NoiseTemplate    Node2D 	   Sprite2D    texture    	   variants                      node_count             nodes        ��������       ����                      ����                    conn_count              conns               node_paths              editable_instances              version             RSRC  ## This is a helper class for game_server. It was originally meant to be an 
## inner class, but there was something wrong with the doc generation
class_name Peer

var tcp_stream : StreamPeerTCP ## TCP client connection
var user_id : int ## User id. Nothing special. Most likely randomly generated
var user_name : String = "" ## User name. To be provided by the client
var time_of_connection : int
var last_message_time : int = 0

static func _create_peer(tcp_stream: StreamPeerTCP, user_id: int, user_name: String, time_of_connection: int) -> Peer:
	var new_peer = Peer.new()
	new_peer.tcp_stream = tcp_stream
	new_peer.user_id = user_id
	new_peer.user_name = user_name
	new_peer.time_of_connection = time_of_connection
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

signal peer_connected(id, user_name) ## Emitted when a client connects
signal peer_disconnected(id) ## Emitted when a client disconnects
signal peer_reconnected(id) ## Emitted when a client reconnects
signal peer_message_received(id, message)


func _ready():
	pass

## Start the TCP server
func start():
	var result = server.listen(PORT)
	return result

## Sends a message as a string in ASCII. [br]
## [param dict] can be changed to another dictionary, depending on which
## dictionary should be used, [member peers] or [member pending_peers]
func send_string(id: int, message: String, target_dict = peers):
	print("Send string to: ", id, ", message = ", message)
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
		var prelude : PackedByteArray
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
			new_peer.tcp_stream.put_string("OK") # TODO: Maybe we don't need this
			peer_connected.emit(new_peer.user_id, new_peer.user_name)
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
   RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script !   res://game_server/game_server.gd ��������      local://PackedScene_xvkok          PackedScene          	         names "   	      GameServer    script    Node    HeartBeatTimer 
   wait_time 
   autostart    Timer    _on_heart_beat_timer_timeout    timeout    	   variants                      �@            node_count             nodes        ��������       ����                            ����                         conn_count             conns                                      node_paths              editable_instances              version             RSRC    GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cuc8l48hq5hwq"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                [remap]

path="res://.godot/exported/133200997/export-7e1d5d1f520910cfebc408bc0ae5240c-SideBar.scn"
            [remap]

path="res://.godot/exported/133200997/export-19418c3edf9a3d188c8320c73219b7e9-SideBarItem.scn"
        [remap]

path="res://.godot/exported/133200997/export-20f44b057545b4cb9a315e5d8c343b0c-board_color_main.scn"
   [remap]

path="res://.godot/exported/133200997/export-b6f8418e97da2a6a62ec57a1b3ca46ea-new_noise_texture_2d.res"
               [remap]

path="res://.godot/exported/133200997/export-abeb4403404b8119260690a3c43affbf-noise_template.scn"
     [remap]

path="res://.godot/exported/133200997/export-3854d556faed144f539f1f683a06d74e-game_server.scn"
        list=Array[Dictionary]([{
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
             X��7�|8.   res://board_color_game/ui/sidebar/SideBar.tscn���.� 2   res://board_color_game/ui/sidebar/SideBarItem.tscn��r �	,   res://board_color_game/board_color_main.tscn������?0   res://board_color_game/new_noise_texture_2d.tres!�����H*   res://board_color_game/noise_template.tscn��ȭ��8"   res://game_server/game_server.tscn(�#C��U   res://icon.svg  ECFG      application/config/name         TCPGameServer      application/run/main_scene4      ,   res://board_color_game/board_color_main.tscn   application/config/features$   "         4.2    Forward Plus       application/config/icon         res://icon.svg     autoload/GameServer,      #   *res://game_server/game_server.tscn    display/window/vsync/vsync_mode              file_customization/folder_colors8               res://board_color_game/ui/        pink   input/W�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   W   	   key_label             unicode    w      echo          script         input/A�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   A   	   key_label             unicode    a      echo          script         input/S�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   S   	   key_label             unicode    s      echo          script         input/D�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode   D   	   key_label             unicode    d      echo          script         input/CameraPan�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script         input/CameraZoomIn�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script         input/CameraZoomOut�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script         input/DragWindow�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask           position              global_position               factor       �?   button_index         canceled          pressed           double_click          script             