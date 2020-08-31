extends Node2D

export (PackedScene) var point_scene

const POINT_NUMBER = 500
const BIAS = 1.0

onready var screen_size = get_viewport().get_visible_rect().size

var perceptron: Perceptron


func _ready() -> void:
	randomize()

	# three weights: x, y, bias
	perceptron = Perceptron.new(3, 0.001)
	
	for i in range(POINT_NUMBER):
		create_point()


func create_point() -> void:
	var point = point_scene.instance()
	point.position = Vector2(
		rand_range(0, screen_size.x), 
		rand_range(0, screen_size.y)
	)
	
	var coordinates = coordinates_to_cartesian(point.position)
	point.value = 1 if coordinates.y >= line(coordinates.x) else -1
	
	$points.add_child(point)


func coordinates_to_cartesian(coordinates: Vector2) -> Vector2:
	var cartesian = Vector2()
	cartesian.x = range_lerp(coordinates.x, 0, screen_size.x, -1, 1)
	cartesian.y = range_lerp(coordinates.y, 0, screen_size.y, -1, 1)
	return cartesian


func cartesian_to_coordinates(cartesian: Vector2) -> Vector2:
	var coordinates = Vector2()
	coordinates.x = range_lerp(cartesian.x, -1, 1, 0, screen_size.x)
	coordinates.y = range_lerp(cartesian.y, -1, 1, 0, screen_size.y)
	return coordinates


func line(x: float) -> float:
	return  -x + 0.3


func guess_y(x: float) -> float:
	return -(perceptron.weights[2] / perceptron.weights[1]) - (perceptron.weights[0] / perceptron.weights[1]) * x


func _process(delta: float) -> void:
	var points = $points.get_children()
	var point = points[randi() % points.size()]
	var coordinates = coordinates_to_cartesian(point.position)
	point.error = perceptron.train([coordinates.x, coordinates.y, BIAS], point.value)

	update()


func _draw() -> void:
	var line_start = cartesian_to_coordinates(Vector2(-1, line(-1)))
	var line_end = cartesian_to_coordinates(Vector2(1, line(1)))
	draw_line(line_start, line_end, Color(0, 0, 255), 5)
	
	var guess_start = cartesian_to_coordinates(Vector2(-1, guess_y(-1)))
	var guess_end = cartesian_to_coordinates(Vector2(1, guess_y(1)))
	draw_line(guess_start, guess_end, Color(255, 0, 0), 5)

