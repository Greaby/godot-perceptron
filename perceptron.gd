extends Node
class_name Perceptron

const learning_rate = 0.01

var weights = []

func _init(n: int):
	randomize()
	for i in range(n):
		# random weights between -1 and 1
		weights.push_back(randf() * 2 - 1)

func compute(values : Array):
	var result = 0
	for i in weights.size():
		result += weights[i] * values[i]
	return sign(result)

func train(values: Array, target: int):
	var result = compute(values)
	var error = target - result

	for i in weights.size():
		weights[i] = lerp(weights[i], weights[i] + error * values[i], learning_rate)