extends Node2D

# ONREADY VARS FOR ROOMS


func _ready() -> void:
	intro_text()
	hide_rooms()

func intro_text():
	await get_tree().create_timer(0.1).timeout
	SignalHandler.message_send.emit("INTRO TEXT")

func hide_rooms():
	pass
