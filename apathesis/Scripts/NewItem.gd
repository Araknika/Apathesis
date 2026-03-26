extends Area2D

@export var data: ItemData

@onready var sprite: Sprite2D = $ItemSprite


# -SET ITEM LOGIC-

var item_id = null

func _ready() -> void:
	set_item()
	SignalHandler.action_interact.connect(pickup)

func set_item():
	if data:
		sprite.texture = data.item_texture
		item_id = data.item_name

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
		SignalHandler.message_send.emit(data.pickup_text)
		InventoryHandler.add_item(data)
		queue_free()
