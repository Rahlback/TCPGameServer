extends Node2D

@export var x_step := 100

var x_offset = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_board(initial_image:  Image):
	var new_sprite : Sprite2D = Sprite2D.new()
	new_sprite.position.x = x_offset
	x_offset += x_step
	new_sprite.set_texture(ImageTexture.create_from_image(initial_image))
	add_child(new_sprite)

func update_board(new_image: Image, index: int):
	get_child(index).set_texture(ImageTexture.create_from_image(new_image))

