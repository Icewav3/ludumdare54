extends Control

var texture1 = preload("res://sprites/mc/Mc placeholder sprite1.png")
var texture2 = preload("res://sprites/mc/Mc placeholder sprite2.png")

var img = {"mcnormal": preload  ("res://sprites/Mc placeholder sprite1.png"),
		   "mcscare": preload ("res://sprites/Mc placeholder sprite2.png")}
		
#idk a way to create simulate a visual novel dialogue without creating an entire library so imma put it in 
#an array for now. We can just itera
var dialogue1 = ["Oh look an elevator", "Sweet"]
var dialogue2 = ["The risk I took was calculated but man.", "I am bad at math"]

var dialogIndex = 0
var finished = false


@onready var sprite = $mc
@onready var dbox = $DialogBox

func _ready():
	sprite.texture = null
	dbox.visible = false;
	
func _process(delta):
		if Input.is_key_pressed(KEY_O):
			sprite.texture = texture2
			dbox.visible = true;
			load_dialog()
		if Input.is_key_pressed(KEY_P):
			sprite.texture = texture1
			dbox.visible = true;
		if Input.is_key_pressed(KEY_I):
			if sprite.visible:
				sprite.visible = false 
				dbox.visible = false
			else: 
				sprite.visible = true #???
				



func load_dialog():
	if dialogIndex < dialogue1.size():
		$DialogBox/RichTextLabel.bbcode_text = dialogue1[dialogIndex]
	dialogIndex += 1

