extends Node2D

# ROOMS
@onready var room_2: Node2D = $LevelSet/Room2

func _ready() -> void:
	SignalHandler.message_send.emit("YOU AWAKE IN A DIM CELL...")
	# HIDES ROOMS ON LOAD
	room_2.visible = false
