extends Node2D

@export var debug : bool

var levels = {}
var state = {"menulevel": preload("res://scenes/MainMenu.tscn"), "level1": preload("res://scenes/level_1.tscn")}
var currentState

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(state["menulevel"].instantiate())
	if(debug):
		print(state["menulevel"])
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
