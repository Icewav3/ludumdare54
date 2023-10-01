extends AudioStreamPlayer

var musicTracks = {"menu": preload("res://audio/Bossa.wav")}

func _ready():
	set("stream", musicTracks["menu"])
	play()
	
