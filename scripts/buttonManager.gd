extends Node
var children = []
var buttonlist = []
var buttonsolution = [2,5,3,9,1,4]
var playersolution = []
var index = []

# creates a button list
func _ready():
	children = get_children()
	for v in children:
		if v is TextureButton:
			buttonlist.append(v)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	'''for v in buttonlist:
		if len(playersolution) > 6:
			playersolution = []
		if v.is_pressed:
			index = buttonlist.find(v)
			playersolution.append(int(index))
			print(playersolution)'''
			
