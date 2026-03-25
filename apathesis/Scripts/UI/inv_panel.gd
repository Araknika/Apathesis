extends MarginContainer

var index: int = -1

@export var slot_scene: PackedScene
@onready var inv_grid: GridContainer = $InvGrid

var inventory: InventoryData

var slots: Array = []

func _ready() -> void:
	inventory = get_node("/root/InventoryHandler")
	SignalHandler.inventory_update.connect(update_ui)
	
	for i in range(20):
		var slot_root = slot_scene.instantiate()
		inv_grid.add_child(slot_root)
		var slot_logic = slot_root.get_node("ItemSlot")
		slot_logic.index = i 
		slots.append(slot_logic)
		
		update_ui()

func update_ui():
	for i in range(slots.size()):
		var slot = slots[i]
		
		if i < InventoryHandler.PlayerInventory.size():
			slot.set_item(inventory.PlayerInventory[i])
		else:
			slot.set_item(null)
