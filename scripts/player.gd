# FILEPATH: /c:/Users/coled/Godot/ludumdare54/scripts/player.gd

extends CharacterBody2D

# The speed at which the player moves
const SPEED = 80.0

# The direction the player is currently facing
var directionFacing = Vector2(0, 1)

# The current direction index (0 or 1)
var currentDirection = 1

# The other direction index (0 or 1)
var otherDirection = 0

# Reference to the AnimationPlayer node
@onready var animationPlayer = $AnimationPlayer

# Reference to the AnimationTree node
@onready var animationTree = $AnimationTree

# Reference to the AnimationState node
@onready var animationState = animationTree.get("parameters/StateMachine/playback")

func _physics_process(_delta):
	# Calculate the input vector based on user input
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# Handle diagonal movement
	if Input.get_action_strength("ui_left") == 1 and Input.get_action_strength("ui_right") == 1:
		input_vector.x = -1
	if Input.get_action_strength("ui_up") == 1 and Input.get_action_strength("ui_down") == 1:
		input_vector.y = -1
		
	# Update currentDirection and otherDirection based on input_vector
	if input_vector[currentDirection] == 0:
		if input_vector[otherDirection] != 0:
			match currentDirection:
				0:
					currentDirection = 1
					otherDirection = 0
				1:
					currentDirection = 0
					otherDirection = 1
					
	# Update animation_tree parameters based on input_vector
	if input_vector != Vector2.ZERO:
		var animation_vector = Vector2.ZERO
		animation_vector[currentDirection] = input_vector[currentDirection]
		
		animationTree.set("parameters/StateMachine/Idle/blend_position", animation_vector)
		animationTree.set("parameters/StateMachine/Walk/blend_position", animation_vector)

		animationState.travel("Walk")
	else:
		animationState.travel("Idle")
		
	# Update directionFacing based on animation_tree parameters
	directionFacing = animationTree.get("parameters/StateMachine/Idle/blend_position")
	
	# Calculate and set the player's velocity
	velocity = input_vector
	set_velocity(velocity * SPEED)
	
	# Move and slide the player
	move_and_slide()
