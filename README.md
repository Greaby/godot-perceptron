# Perceptron - Godot Engine

The perceptron, also known as a neuron, is used in machine learning as the building block of a neural network.
It is used to classify the results of a linear equation.

It receives several inputs and returns a value at the output.

In this example, the perceptron tries to find the boundary between black and white points in a 2d plane.

## How to use

You can instantiate a new perceptron with its number of inputs and its learning rate.

```gdscript
var my_perceptron = Perceptron.new(INPUT_NUMBERS, LEARNING_RATE)
```

To train the perceptron, pass the input values and the expected result to the training function.

```gdscript
my_perceptron.train([INPUT_1, INPUT_X...], EXEPTED_RESULT)
```

To get the perceptron result use :

```gdscript
var result = my_perceptron.compute([INPUT_1, INPUT_X...])
```
