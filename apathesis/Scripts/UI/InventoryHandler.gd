extends Node
class_name InventoryData

@export var PlayerInventory : Array[ItemData] = []
const INVENTORY_SIZE :=20

func _ready() -> void:
	set_size()

func set_size():
	for i in INVENTORY_SIZE:
		PlayerInventory.append(null)


# ITEM ADD/REMOVE LOGIC
func add_item(item: ItemData):
	for i in INVENTORY_SIZE:
		if PlayerInventory[i] == null:
			PlayerInventory[i] = item
			SignalHandler.inventory_update.emit()
			return

func remove_item(index: int):
	if index >= 0 and index < PlayerInventory.size():
		PlayerInventory.remove_at(index)
		SignalHandler.inventory_update.emit()

# MESSAGE LOGIC
func message_description():
	pass
