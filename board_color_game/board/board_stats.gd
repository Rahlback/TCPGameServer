extends Control

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







