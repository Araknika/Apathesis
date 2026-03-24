extends Area2D

@onready var tile: TileMapLayer = $"../TileMapLayer"
@onready var collision_shape: CollisionShape2D = $"../StaticBody2D/CollisionShape2D"
@onready var audio_stream: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"


func _ready() -> void:
	SignalHandler.action_interact.connect(open_door)

#Detects if player is inside and sets a var
var player_inside = false

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("player"):
		player_inside = true

func _on_area_exited(area: Area2D) -> void:
		if area.has_method("player"):
			player_inside = false


func open_door():
	if player_inside:
		SignalHandler.message_send.emit("The heavy stone door slides open")
		tile.visible = false
		collision_shape.disabled = true
		audio_stream.play()
