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
class_name Board

@export var default_width_min = 10
@export var default_width_max = 100
@export var default_height_min = 10
@export var default_height_max = 100
@export var number_of_seeds = 3000

const NOISE_TEMPLATE = preload("res://board_color_game/noise_template.tscn")
const NEW_NOISE_TEXTURE_2D = preload("res://board_color_game/new_noise_texture_2d.tres")

var player_colors : Dictionary
var player_positions : Dictionary
var board : Image
var starting_board : Image

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
	
	starting_board = board.duplicate(true)
	

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
func take_moves(player_moves: Dictionary):
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
# TODO
# Function to move players on board based on input. Return updated state of the board.
# Function to get updated state of the board 
# Save history of the players? In order to be able to repeat it.
# Maybe just have an observer instead?
# Maybe if there is a flag so that the memory consumption isn't too high

