extends Area2D

const JAGGED_KEY = preload("uid://7cjw4d46s2hh")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("test1"):
		print_array()
	if Input.is_action_just_pressed("test2"):
		InventoryHandler.add_item(JAGGED_KEY)


func print_array():
	print(InventoryHandler.PlayerInventory)
