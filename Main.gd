extends Node2D

const BIAS = 1
var perceptron

var points = []

onready var screen_size = get_viewport().get_visible_rect().size

func _ready():
	randomize()
	var pointScene = preload("res://Point.tscn")
	# 3 weights : x, y, bias
	perceptron = Perceptron.new(3, 0.000001)
	
	for i in range(500):
		var point = pointScene.instance()
		point.position = Vector2(rand_range(0, screen_size.x), rand_range(0, screen_size.y))
		point.type = 1 if point.position.y >= line(point.position.x) else -1
		add_child(point)
		

func line(x):
	return x + 100
	
func guessY(x):
	return (- perceptron.weights[0]*x - perceptron.weights[2]) / perceptron.weights[1]

func _process(delta):
	
	var point = get_children()[randi() % get_child_count()]
	point.error = perceptron.train([point.position.x, point.position.y, BIAS], point.type)
	
	update()
	
func _draw():
	draw_line(Vector2(0, line(0)), Vector2(screen_size.x, line(screen_size.x)), Color(0, 0, 255), 5)
	draw_line(Vector2(0, guessY(0)), Vector2(screen_size.x, guessY(screen_size.x)), Color(255, 0, 0), 5)
	