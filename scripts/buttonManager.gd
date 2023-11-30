extends Node

# List of child nodes
var children = []

# List of buttons
var buttonlist = []

# Solution for the buttons
var buttonsolution = [2, 5, 3, 9, 1, 4]

# Solution entered by the player
var playersolution = []

# Index of the player's solution
var index = []

# Called when the node enters the scene tree for the first time
func _ready():
	children = get_children()
	for v in children:
		if v is TextureButton:
			buttonlist.append(v)
			
	for item in buttonlist:
		item.connect("button_press", Callable(self, "on_button_press"))

# Called every frame
func _process(delta):
	pass
			
# Called when a button is pressed
func on_button_press(number):
	playersolution.append(number)
	if len(playersolution) > 6:
		playersolution.remove_at(0)
		
	print(playersolution)
		
	if playersolution == buttonsolution:
		$End.visible = true
