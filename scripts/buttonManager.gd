extends Node
var children = []
var buttonlist = []

# Called when the node enters the scene tree for the first time.
func _ready():
	children = get_children()
	for v in children:
		if v is TextureButton:
			buttonlist.append(v)
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
