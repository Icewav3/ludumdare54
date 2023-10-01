extends Control

var texture1 = preload("res://sprites/mc/Mc placeholder sprite1.png")
var texture2 = preload("res://sprites/mc/Mc placeholder sprite2.png")

var img = {"mcnormal": preload  ("res://sprites/Mc placeholder sprite1.png"),
		   "mcscare": preload ("res://sprites/Mc placeholder sprite2.png")}
		
#idk a way to create simulate a visual novel dialogue without creating an entire library so imma put it in 
#an array for now. We can just itera
var dialogue1 = ["Oh look an elevator", "crap"]
var dialogue2 = ["The risk I took was calculated but man.", "I am bad at math"]

var dialogIndex = 0
var finished = false

@onready var sprite = $mc
@onready var dbox = $DialogBox

func _ready():
	sprite.texture = null
	dbox.visible = false;
	
func _process(delta):
	load_dialog()
	
func _input(event) :
	if event.is_action_pressed("ui_page_up"):
		sprite.texture = img["mcscare"]
		sprite.visible = true;
		dbox.visible = true;
	if event.is_action_pressed("ui_page_down"):
		sprite.texture = img["mcnormal"]
		sprite.visible = true;
		dbox.visible = true;
	if event.is_action_pressed("ui_end"):
		if sprite.visible:
			sprite.visible = false 
			dbox.visible = false
	
	if dbox.visible:
		if event.is_action_pressed("ui_accept"):
			dialogIndex+=1
			if dialogIndex == dialogue1.size():
				dbox.visible = false
				sprite.visible = false
				dialogIndex=0


func load_dialog():
	if dialogIndex < dialogue1.size():
		$DialogBox/RichTextLabel.bbcode_text = dialogue1[dialogIndex]
		if Input.is_key_pressed(KEY_L):
			dialogIndex+=1
			$DialogBox/RichTextLoabel.bbcode_text = dialogue1[dialogIndex]
		print (dialogue1[dialogIndex][dialogIndex])
	
