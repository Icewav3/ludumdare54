extends AudioStreamPlayer


var effects = {"button" : preload("res://audio/Button.wav"), "hum": preload("res://audio/Elevator Hum.wav")}

func play_sound(sound):
	set("stream", effects[sound])
	play()
