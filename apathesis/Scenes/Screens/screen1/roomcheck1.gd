extends Area2D

func _ready() -> void:
	pass

# CHECKS IF PLAYER IS IN ROOM
var in_room :=false

func _on_area_entered(area):
	if area.has_method("player"):
		in_room = true

func _on_area_exited(area):
	if area.has_method("player"):
		in_room = false
