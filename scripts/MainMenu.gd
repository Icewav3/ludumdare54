extends Node2D

var state
@onready var startButton = $StartButton
@onready var effect = get_tree().root.get_node("GlobalScene/EffectsPlayer")
var globalScene = preload("res://scripts/StateManager.gd")

signal change_level

# Called when the node enters the scene tree for the first time.
func _ready():
	state = globalScene.get_data()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if startButton.button_pressed:
		emit_signal("change_level")
		effect.play_sound("button")
		set_process(false)
		
		# get_child(1).queue_free() removed this and it works?
