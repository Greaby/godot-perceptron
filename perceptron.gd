extends Node
class_name Perceptron

var learning_rate: float
var weights: Array = []

func _init(n: int, _learning_rate: float) -> void:
	randomize()
	learning_rate = _learning_rate
	for i in range(n):
		# random weights between -1 and 1
		weights.push_back(rand_range(-1, 1))


func compute(inputs: Array) -> bool:
	var sum: float = 0.0
	for i in range(weights.size()):
		sum += inputs[i] * weights[i]

	return sum > 0


func train(inputs: Array, target: int) -> int:
	var guess: int = 1 if compute(inputs) else -1
	var error: int = target - guess
	if error != 0:
		for i in range(weights.size()):
			weights[i] += error * inputs[i] * learning_rate

	return error
