extends Node2D

var type = 0
var error = 2

func _process(delta):
	update()

func _draw():
	if(type == 1):
		draw_circle(Vector2(), 8, Color(0, 0, 255))
	else:
		draw_circle(Vector2(), 8, Color(0, 255, 0))
		
	if(error == 0):
		draw_circle(Vector2(), 4, Color(255, 255, 255))
	else:
		draw_circle(Vector2(), 4, Color(0, 0, 0))