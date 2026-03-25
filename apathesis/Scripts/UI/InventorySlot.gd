extends Control

@onready var icon: TextureRect = $ItemSlot/Icon

func set_item(new_item: ItemData):
	item = new_item
	
	if item:
		icon.texture = item.item_texture
	else:
		icon.texture = null

# DRAG LOGIC
var item: ItemData = null
var index: int = -1

func _get_drag_data(_at_position: Vector2) -> Variant:
	if item == null:
		return
	
	var preview = TextureRect.new()
	preview.texture = icon.texture
	preview.size = Vector2(42,42)
	preview.self_modulate = Color(1, 1, 1, 0.5)
	
	var container = Control.new()
	container.custom_minimum_size = preview.size
	
	container.add_child(preview)
	preview.position = -preview.size / 2
	
	set_drag_preview(container)
	return {
		"item": item,
		"from_index": index,
		"from_slot": self
	}

# DROP LOGIC
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return data is Dictionary and data.has("item")

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var from_index =data["from_index"]
	var from_slot = data["from_slot"]
	
	var temp = InventoryHandler.PlayerInventory[index]
	InventoryHandler.PlayerInventory[index] = InventoryHandler.PlayerInventory[from_index]
	InventoryHandler.PlayerInventory[from_index] = temp
	
	SignalHandler.inventory_update.emit()
