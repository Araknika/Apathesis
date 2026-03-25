extends MarginContainer

@export var slot_scene: PackedScene
@onready var inv_grid: GridContainer = $InvGrid

var inventory: InventoryData

var slots: Array = []

func _ready() -> void:
	inventory = get_node("/root/InventoryHandler")
	SignalHandler.inventory_update.connect(update_ui)
	
	for i in range(20):
		var slot = slot_scene.instantiate()
		slot.index = i
		inv_grid.add_child(slot)
		slots.append(slot)
		
		update_ui()

func update_ui():
	for i in range(slots.size()):
		var slot = slots[i]
		
		if i < InventoryHandler.PlayerInventory.size():
			slot.set_item(inventory.PlayerInventory[i])
		else:
			slot.set_item(null)


# Inspect logic

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("m2"):
		inspect_message()

func inspect_message():
	SignalHandler.description_pull.emit()
