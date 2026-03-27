extends Node2D




func _ready() -> void:
	hide_rooms()
	play_music()

func hide_rooms():
	$Rooms/Room2.visible = false
	$Rooms/Room3.visible = false
	$Rooms/Room4.visible = false
	$Rooms/Room5.visible = false
	$Rooms/Room6.visible = false
	$Rooms/Room7.visible = false

func play_music():
	SignalHandler.play_song.emit("Explore 1")
