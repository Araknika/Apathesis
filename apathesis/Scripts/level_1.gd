extends Node2D


func _ready() -> void:
	SignalHandler.message_send.emit("YOU AWAKE IN A DIM CELL...")
