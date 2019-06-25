extends Node
class_name Perceptron

var weights = []

func _init(n: int):
	randomize()
	for i in range(n):
		# random weights between -1 and 1
		weights.push_back(randf() * 2 - 1)
