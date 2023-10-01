extends TextureButton


@export var num: int

signal button_press(number)



func _on_button_down():
	emit_signal("button_press", num)
