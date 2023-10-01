extends Node2D


@onready var startButton = $StartButton

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if startButton.button_pressed:
		#Todo Logic here for transition to level 1? or dialogue ui
		print("Pressed!")
