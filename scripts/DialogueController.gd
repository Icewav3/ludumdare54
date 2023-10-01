extends Control

var img = {"mcnormal": preload  ("res://sprites/Mc placeholder sprite1.png"),
		   "mcscare": preload ("res://sprites/Mc placeholder sprite2.png")}
@onready var character_sprite = $mc		   
var current_dialogue_index = 0

# list of dictionaries for dialogue
var dialogues = [
	{
		"text": "Oh look, an elevator!",
		"char_sprite": img["mcnormal"]
	},
	{
		"text": ". . . crap",
		"char_sprite": img["mcscare"]
	},
	{
		"text": "The risk I took was calculated but man. . . I am bad at math",
		"char_sprite": img["mcscare"]
	}
]
func _ready():
	character_sprite.texture = dialogues[current_dialogue_index]["char_sprite"]
	show_dialogue(true)

func _process(delta):
	show_dialogue(true)
		
func _input(event) :
	if event.is_action_pressed("space"): # UI next input map for spacebar
		current_dialogue_index += 1
		# print(current_dialogue_index)
'''		if current_dialogue_index >= len(dialogues):
					current_dialogue_index = 0  # Reset to the first dialogue
		else:
			pass'''
func show_dialogue(value : bool):
	# Check if there are more dialogues to display
	#print(current_dialogue_index < len(dialogues), value)
	if current_dialogue_index < len(dialogues) and value == true:
		character_sprite.visible = true
		$DialogBox.visible = true
		var dialogue_text = dialogues[current_dialogue_index]["text"]
		# Display the dialogue text using your dialogue system
		# For example, you might have a Label node for this purpose
		$DialogBox/RichTextLabel.bbcode_text = dialogue_text
		
		# Update the character sprite
		character_sprite.texture = dialogues[current_dialogue_index]["char_sprite"]
	else:
		character_sprite.visible = false
		$DialogBox.visible = false
		get_parent().get_node("Player").set_physics_process(true)
		get_parent().get_node("Buttons/Button").disabled = false
