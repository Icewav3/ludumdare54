extends Node2D

var state
@onready var effect = get_tree().root.get_node("GlobalScene/EffectsPlayer")
var globalScene = preload("res://scripts/StateManager.gd")

@onready var buttonPanel = preload("res://scenes/objects/button_panel.tscn")

func _ready():
	$Player.set_physics_process(false)
	state = globalScene.get_data()
	effect.play_sound("hum")

func _process(_delta):
	if Input.is_action_just_pressed("space"):
		if $Note.visible:
			$Note.visible = false
			$"Sticky Note/StickyButton".disabled = false
			$Player.set_physics_process(true)
		elif $ButtonPanel.visible:
			$Buttons/Button.disabled = false
			$Player.set_physics_process(true)
			$ButtonPanel.visible = false

func complete_level():
	add_child(state["level2"].instantiate())
	set_process(false)

func _on_button_button_down():
	$Buttons/Button.disabled = true
	$Player.set_physics_process(false)
	$ButtonPanel.visible = true

func _on_sticky_button_button_down():
	$"Sticky Note/StickyButton".disabled = true
	$Player.set_physics_process(false)
	$Note.visible = true
