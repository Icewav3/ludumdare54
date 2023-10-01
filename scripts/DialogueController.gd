extends Control

var texture1 = preload("res://sprites/mc/Mc placeholder sprite1.png")
var texture2 = preload("res://sprites/mc/Mc placeholder sprite2.png")

var img = {"mcnormal": preload  ("res://sprites/Mc placeholder sprite1.png"),
		   "mcscare": preload ("res://sprites/Mc placeholder sprite2.png")}


@onready var sprite = $mc

func _ready():
	sprite.texture = null
	
func _process(delta):
		if Input.is_key_pressed(KEY_O):
			sprite.texture = texture2
		if Input.is_key_pressed(KEY_P):
			sprite.texture = texture1
		if Input.is_key_pressed(KEY_I):
			if sprite.visible:
				sprite.visible = false 
			else: 
				sprite.visible = true #???
				

			
			
func spriteDialogueController():
	# Access the Rich Text Label node
	var richTextLabel = $dialoguetext
	richTextLabel.add_text("I almost joined their bloody team")

