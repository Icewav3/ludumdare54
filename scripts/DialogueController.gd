extends Control

# Dictionary containing the character sprites
var img = {
	"mcnormal": preload("res://sprites/Main character calm.png"),
	"mcscare": preload("res://sprites/Main character nervous.png")
}

# Reference to the character sprite node
@onready var character_sprite = $mc

# Index of the current dialogue in the dialogues list
var current_dialogue_index = 0

# List of dictionaries representing the dialogues
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
	# Set the initial character sprite and show the dialogue
	character_sprite.texture = dialogues[current_dialogue_index]["char_sprite"]
	show_dialogue(true)

func _process(delta):
	# Continuously show the dialogue
	show_dialogue(true)

func _input(event):
	if event.is_action_pressed("space"):
		# Move to the next dialogue when the spacebar is pressed
		current_dialogue_index += 1

func show_dialogue(value: bool):
	# Check if there are more dialogues to display
	if current_dialogue_index < len(dialogues) and value == true:
		character_sprite.visible = true
		$DialogBox.visible = true
		var dialogue_text = dialogues[current_dialogue_index]["text"]
		$DialogBox/RichTextLabel.bbcode_text = dialogue_text
		character_sprite.texture = dialogues[current_dialogue_index]["char_sprite"]
	else:
		character_sprite.visible = false
		$DialogBox.visible = false
		get_parent().get_node("Player").set_physics_process(true)
		get_parent().get_node("Buttons/Button").disabled = false
