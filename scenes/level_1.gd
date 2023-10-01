extends Node2D

var state
@onready var startButton = $StartButton
@onready var effect = get_tree().root.get_node("GlobalScene/EffectsPlayer")
var globalScene = preload("res://scripts/StateManager.gd")

func _ready():
	state = globalScene.get_data()
	effect.play_sound("hum")

func _process(delta):
	pass

func complete_level():
	add_child(state["level2"].instantiate())
	set_process(false)
