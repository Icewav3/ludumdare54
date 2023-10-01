extends AudioStreamPlayer

var musicTracks = {"menu": preload("res://audio/Bossa.wav"), "level1": preload("res://audio/Elev1.wav")}

func _ready():
	set("stream", musicTracks["menu"])
	play()
	
func play_sound(sound):
	stop()
	set("stream", musicTracks[sound])
	play()
