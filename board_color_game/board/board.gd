extends Node2D
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

var player_colors : Dictionary ## {player_id: Color}
var rev_player_colors: Dictionary ## {Color: player_id}
var player_positions : Dictionary ## {player_id: Vector2i}
var player_numbers : Dictionary
var rev_player_numbers : Dictionary
var player_floors : Dictionary

var board : Image
var starting_board : Image
var player_board_tiles : Dictionary

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
			var row : PackedByteArray
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

func _get_cached_scaled_image(scale: int = 5):
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

	#var player_rect = Rect2i(0, 0, scale/2, scale/2)
	#var player_image = Image.create(scale/2, scale/2, false, Image.FORMAT_RGBA8)
	#player_image.fill(Color.CORAL)
	#for player_id in player_positions:
		#var pos = player_positions[player_id] * scale
		#pos += Vector2i(scale/4, scale/4)
		#scaled_image.blit_rect(player_image, player_rect, pos)
		
	var player_rect = Rect2i(0, 0, tile_width/2, tile_height/2)
	var player_image = Image.create(tile_width/2, tile_height/2, false, Image.FORMAT_RGBA8)
	player_image.fill(Color.CORAL)
	for player_id in player_positions:
		var pos = player_positions[player_id] * tile_width
		pos += Vector2i(tile_width/4, tile_height/4)
		scaled_image.blit_rect(player_image, player_rect, pos)
	return scaled_image

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
	# TODO Replace with board_data check
	return compare_colors(board.get_pixelv(pos), Color.BLACK)

func is_oob(pos: Vector2i):
	# TODO Replace board with board_data
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
		var pos : Vector2i = next_player_pos[player_id]
		board_data[pos.y][pos.x] = player_numbers[player_id]
		# TODO: Remove from here
		board.set_pixelv(next_player_pos[player_id], player_colors[player_id])
		# To here
		player_positions[player_id] = next_player_pos[player_id]
		
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

func get_number_of_moves():
	return number_of_moves
	
# TODO
# Function to get updated state of the board 
# Save history of the players? In order to be able to repeat it.
# Maybe just have an observer instead?
# Maybe if there is a flag so that the memory consumption isn't too high



func _on_base_image_ready():
	call_deferred("_update_images")
