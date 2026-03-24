extends Node
class_name InventoryData

@export var PlayerInventory : Array[ItemData] = []

func add_item(item):
	PlayerInventory.append(item)
