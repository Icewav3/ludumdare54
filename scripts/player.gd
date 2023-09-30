extends CharacterBody2D


const SPEED = 80.0

var directionFacing = Vector2(0, 1)

var currentDirection = 1
var otherDirection = 0

@onready var animationPlayer = $AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/StateMachine/playback")
