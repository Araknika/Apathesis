extends Panel

@onready var icon: TextureRect = $Icon
@onready var root = get_parent()

func _ready() -> void:
	item_signals()

func _process(delta: float) -> void:
	pass

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
	
	var drag_preview = Control.new()
	var preview_icon = TextureRect.new()
	
	preview_icon.texture = icon.texture
	preview_icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview_icon.custom_minimum_size = Vector2(40, 40)
	preview_icon.modulate.a = 0.5
	preview_icon.position = -0.5 * preview_icon.custom_minimum_size
	drag_preview.add_child(preview_icon)
	set_drag_preview(drag_preview)
	
	return {
		"item": item,
		"from_index": index,
		"from_slot": self
	}

# DROP LOGIC
func _can_drop_data(_pos, data) -> bool:
	return data is Dictionary and data.has("item")

func _drop_data(_post, data) -> void:
	var from_index =data["from_index"]
	
	var temp = InventoryHandler.PlayerInventory[index]
	InventoryHandler.PlayerInventory[index] = InventoryHandler.PlayerInventory[from_index]
	InventoryHandler.PlayerInventory[from_index] = temp
	
	SignalHandler.inventory_update.emit()
	
	
# HOVER LOGIC
var hovered := false

func _on_mouse_entered() -> void:
	hovered = true
func _on_mouse_exited() -> void:
	hovered = false


# ITEM DATA SIGNAL LOGIC
func item_signals():
	SignalHandler.name_pull.connect(send_name)
	SignalHandler.type_pull.connect(send_type)
	SignalHandler.description_pull.connect(send_description)

func send_name():
	SignalHandler.name_send.emit(item.item_name)

func send_type():
	SignalHandler.type_send.emit(item.item_type)

func send_description():
	if item and hovered:
		SignalHandler.description_send.emit(item.item_description)


# CONTEXT MENU LOGIC

func _on_gui_input(event: InputEvent) -> void:
	if item and hovered and event is InputEventMouseButton and event.button_index == (MOUSE_BUTTON_RIGHT) and event.pressed:
		SignalHandler.slot_index.emit(index)
