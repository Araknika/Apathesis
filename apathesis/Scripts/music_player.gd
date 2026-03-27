extends Node2D

@onready var audio_stream: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	SignalHandler.play_song.connect(music_player)

var music_library = {
	"Explore 1": "res://Assets/Sounds/Music/The Traitor King's Court.wav"
}

func music_player(song_name:String):
	if music_library.has(song_name):
		var stream = load(music_library[song_name])
		audio_stream.stream = stream
		audio_stream.play()
