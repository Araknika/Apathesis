extends Node2D

@onready var menu: PopupMenu = $ContextMenu

func _ready() -> void:
	signal_connections()

func signal_connections():
	SignalHandler.slot_index.connect(item_search)
	SignalHandler.PlayerPos_send.connect(set_player_pos)

var found_item: ItemData = null
var playerpos = null
var item_index = -1

func set_player_pos(current: Vector2):
	playerpos = current

func item_search (target: int):
	item_index = target
	if target >= 0 and target < InventoryHandler.PlayerInventory.size():
		found_item = InventoryHandler.PlayerInventory[target]
		popup_context()

func popup_context():
	menu.popup(Rect2(get_global_mouse_position(), Vector2.ZERO))
	menu.clear()
	for Key in ItemData.context_options:
		var bit_value = ItemData.context_options[Key]
		
		if bit_value & found_item.context:
			menu.add_item(Key)

func _on_context_menu_id_pressed(id: int) -> void:
	var indextext = menu.get_item_text(id)
	match indextext:
		"INSPECT":
			do_inspect()
			pass
		"DROP":
			do_drop()
			pass


func do_inspect():
	SignalHandler.message_send.emit(found_item.item_description)

func do_drop():
	SignalHandler.PlayerPos_pull.emit()
	var item_scene = preload("res://Resources/Items/NewItem.tscn").instantiate()
	item_scene.data = found_item
	NodeHandler.itemlayer.add_child(item_scene)
	item_scene.global_position = playerpos
	InventoryHandler.PlayerInventory[item_index] = null
	SignalHandler.inventory_update.emit()
