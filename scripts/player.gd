extends CharacterBody2D


const SPEED = 80.0

var directionFacing = Vector2(0, 1)

var currentDirection = 1
var otherDirection = 0

@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/StateMachine/playback")

func _physics_process(_delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	if Input.get_action_strength("ui_left") == 1 and Input.get_action_strength("ui_right") == 1:
		input_vector.x = -1
	if Input.get_action_strength("ui_up") == 1 and Input.get_action_strength("ui_down") == 1:
		input_vector.y = -1
		
	if input_vector[currentDirection] == 0:
		if input_vector[otherDirection] != 0:
			match currentDirection:
				0:
					currentDirection = 1
					otherDirection = 0
				1:
					currentDirection = 0
					otherDirection = 1
					
	if input_vector != Vector2.ZERO:
		var animation_vector = Vector2.ZERO
		animation_vector[currentDirection] = input_vector[currentDirection]
		
		animationTree.set("parameters/StateMachine/Idle/blend_position", animation_vector)
		animationTree.set("parameters/StateMachine/Walk/blend_position", animation_vector)

		animationState.travel("Walk")
	else:
		animationState.travel("Idle")
		
	directionFacing = animationTree.get("parameters/StateMachine/Idle/blend_position")
	
	velocity = input_vector

	
	set_velocity(velocity * SPEED)
	move_and_slide()
