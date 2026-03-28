extends MarginContainer


@onready var v_box: VBoxContainer = $ScrollContainer/VBoxContainer
@onready var label: Label = $Label

var has_note := false

func _ready() -> void:
	SignalHandler.note_add.connect(new_note)

func new_note(item:ItemData, index:int):
	var note = load("uid://ct7mmpvxtosq0").instantiate()
	note.note_item = item
	v_box.add_child(note)
	InventoryHandler.PlayerInventory[index] = null
	SignalHandler.inventory_update.emit()
	if !has_note:
		has_note = true
		label.queue_free()
	
