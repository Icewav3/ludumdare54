extends Node2D

@export var debug : bool

static var state = {"menulevel": preload("res://scenes/MainMenu.tscn"),
			 "level1": preload("res://scenes/level_1.tscn"),
			 "level2": preload("res://scenes/level_2.tscn"),
			 "level3": preload("res://scenes/level_3.tscn")}
var currentState = state["menulevel"]

# Called when the node enters the scene tree for the first time.
func _ready():
	$testsprite.add_sibling(state["menulevel"].instantiate())
	$MainMenu.connect("change_level",Callable(self,"on_level_changed"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
func on_level_changed():
	$AnimationPlayer.play("FadeOut")
	
func change_level():
	$MainMenu.queue_free()
	$testsprite.add_sibling(state["level1"].instantiate())
	$AnimationPlayer.play("FadeIn")
	$MusicPlayer.play_sound("level1")

static func get_data():
	return state
			
	
