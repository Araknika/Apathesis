extends Area2D

func _ready() -> void:
	connect_look()

# CHECKS IF PLAYER IS IN ROOM
var in_room :=false

func _on_area_entered(area):
	if area.has_method("player"):
		in_room = true

func _on_area_exited(area):
	if area.has_method("player"):
		in_room = false

#MESSAGE LOGIC
func connect_look():
		SignalHandler.action_look.connect(look)

func look():
	if in_room:
		SignalHandler.message_send.emit("THE COLD STONE WALLS SUFFOCATE YOU")
