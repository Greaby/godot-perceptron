extends Node2D

var value: int = 1
var error: int = 3

func _process(delta: float) -> void:
	update()


func _draw() -> void:
	if error == 3:
		draw_circle(Vector2(), 8, Color.darkorange)
	elif error == 0:
		draw_circle(Vector2(), 8, Color.green)
	else:
		draw_circle(Vector2(), 8, Color.red)
	
	
	if value == 1:
		draw_circle(Vector2(), 6, Color.white)
	else:
		draw_circle(Vector2(), 6, Color.black)
	
	
