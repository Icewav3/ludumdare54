extends Node2D

var levels = {}
var maps = {"1": preload("res://scenes/MainMenu.tscn"), "2": preload("res://scenes/level_1.tscn"), "3": preload("res://Maps/room_3.tscn"), 


enum GameState {
	MAIN_MENU,
	LEVEL1,
	LEVEL2,
}

var current_state: GameState = GameState.MAIN_MENU

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			if current_state == GameState.MAIN_MENU:
				transition_to_level1()
			elif current_state == GameState.LEVEL1:
				transition_to_main_menu()
			elif current_state == GameState.LEVEL2:
				transition_to_main_menu()

func transition_to_main_menu():
	current_state = GameState.MAIN_MENU
	$MainMenu.show()
	$Level1.hide()
	$Level2.hide()
	emit_signal("state_changed", current_state)
	print(current_state)

func transition_to_level1():
	current_state = GameState.LEVEL1
	$MainMenu.hide()
	$Level1.show()
	$Level2.hide()
	emit_signal("state_changed", current_state)
	print(current_state)

"""func transition_to_level2():
	current_state = GameState.LEVEL2
	$MainMenu.hide()
	$Level1.hide()
	$Level2.show()
	emit_signal("state_changed", current_state)"""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
