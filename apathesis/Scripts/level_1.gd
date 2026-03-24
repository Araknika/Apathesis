extends Node2D


func _ready() -> void:
	SignalHandler.message_send.emit("You awake in a dim stone room...")
