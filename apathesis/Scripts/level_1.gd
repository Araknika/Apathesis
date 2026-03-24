extends Node2D

# ROOMS
@onready var room_2: Node2D = $LevelSet/Room2

func _ready() -> void:
	intro_text()
	hide_rooms()

func intro_text():
	await get_tree().create_timer(0.2).timeout
	SignalHandler.message_send.emit("YOU AWAKE IN A DIM CELL...")

func hide_rooms():
	room_2.visible = false
