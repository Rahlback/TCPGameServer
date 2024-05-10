@tool
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
