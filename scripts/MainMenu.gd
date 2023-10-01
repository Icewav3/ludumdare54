extends Node2D

var state
@onready var startButton = $StartButton
var globalScene = preload("res://scripts/StateManager.gd")

func _ready():
	state = globalScene.get_data()

func _process(delta):
		if startButton.button_pressed:
			#get_child(1).queue_free() removed this and it works?
			add_child(state["level1"].instantiate())
			set_process(false)
