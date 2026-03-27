extends Area2D

@onready var key: Node2D = $".."
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	SignalHandler.action_interact.connect(pickup)

#Detects if player is inside and sets a var
var player_inside = false

func _on_area_entered(area: Area2D) -> void:
	if area.has_method("player"):
		player_inside = true

func _on_area_exited(area: Area2D) -> void:
	if area.has_method("player"):
		player_inside = false

#Pickup logic
func pickup():
	if player_inside:
		SignalHandler.message_send.emit("YOU POCKET THE KEY")
		InventoryHandler.add_item(JAGGED_KEY)
		key.visible = false
		collision_shape.disabled = true
