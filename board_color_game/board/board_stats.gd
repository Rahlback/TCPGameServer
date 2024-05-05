extends Control



var points : Dictionary ## Dictionary{Line_id: Array[int], ...}

var draw_points : Dictionary ## {line_id: Points, ...}

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

func draw_graph(line_colors_inp = null):
	# Calculate pixels per x component
	var pixel_step_x = width / max_points
	var pixel_step_y = height / 50 # We need to know the max number you can get
	#print_debug(pixel_step_x, ", max_points=", max_points)
	
	draw_points.clear()
	for line_id in points:
		# Points = {Line_id: Array[int], ...}
		var line_points = Points.new()
		if line_colors_inp:
			if line_id in line_colors_inp:
				line_points.color = line_colors_inp[line_id]
		var x = 0.0
		for p in points[line_id]:
			#print(p)
			# p = int, y value
			line_points.points.append(Vector2(x * pixel_step_x, -p * pixel_step_y))
			x += 1
		draw_points[line_id] = line_points
		print(line_points.points)
	
	queue_redraw()

func _draw():
	for line in draw_points:
		
		line = draw_points[line]
		if len(line.points) <= 1:
			continue
		
		var x_next = 1
		for x in len(line.points) - 1:
			print_debug(line.points[x], " -> ", line.points[x_next])
			draw_line(line.points[x], line.points[x_next],
					 line.color, 3, true)
			x_next += 1







