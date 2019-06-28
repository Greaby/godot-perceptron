extends Node
class_name Perceptron

var learning_rate
var weights = []

func _init(n: int, learning_rate_: float):
	learning_rate = learning_rate_
	randomize()
	for i in range(n):
		# random weights between -1 and 1
		weights.push_back(rand_range(-1, 1))

func compute(inputs : Array):
	var sum = 0
	for i in range(weights.size()):
		sum += inputs[i] * weights[i]

	return 1 if sum > 0 else -1

func train(inputs: Array, target: int):
	var guess = compute(inputs)
	var error = target - guess
	
	for i in range(weights.size()):
		weights[i] += error * inputs[i] * learning_rate
		
	return error