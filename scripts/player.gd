extends CharacterBody2D


const SPEED = 40

@export var directionFacing = Vector2(0, 1)

@export var currentDirection = 1
@export var otherDirection = 0

var input_vector = Vector2.ZERO

@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/StateMachine/playback")

func _physics_process(_delta):
	input_vector.x = 0
	input_vector.y = 0
	
	if Input.is_action_pressed("ui_left"):
		input_vector.x = -1
	
	if Input.is_action_pressed("ui_right"):
		input_vector.x = +1
		
	if Input.is_action_pressed("ui_up"):
		input_vector.y = -1 
		
	if Input.is_action_pressed("ui_down"):
		input_vector.y = +1
		
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
	

	print ("X vector : ", input_vector.x)
	print ("Y Vector : ", input_vector.y)
	



