extends Node2D

var state
@onready var startButton = $StartButton
var globalScene = preload("res://scripts/StateManager.gd")

func _ready():
	state = globalScene.get_data()

func _process(delta):
		if startButton.button_pressed:
			pass

func complete_level():
	add_child(state["level2"].instantiate())
	set_process(false)
