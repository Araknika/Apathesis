extends Node2D

@onready var tile: TileMapLayer = $TileMapLayer
@onready var collision: CollisionPolygon2D = $StaticBody2D/CollisionPolygon2D
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	SignalHandler.action_interact.connect(open_door)

var player_inside = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.has_method("player"):
		player_inside = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.has_method("player"):
		player_inside = false

var opened := false

func open_door():
	if player_inside and !opened:
		audio.play()
		tile.visible = false
		collision.disabled = true
		opened = true
		SignalHandler.message_send.emit("THE HEAVY STONE DOOR SLIDES OPEN")
		$"../../Room3".visible = true
	elif player_inside: SignalHandler.message_send.emit("THE DOOR IS STUCK OPEN")
		
