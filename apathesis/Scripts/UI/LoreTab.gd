extends MarginContainer

@onready var label: Label = $Label
@onready var v_box: VBoxContainer = $ScrollContainer/VBoxContainer

var has_lore := false

func _ready() -> void:
	SignalHandler.lore_add.connect(new_note)

func new_note(item:ItemData):
	var lore = load("uid://bo613a3fi03e3").instantiate()
	lore.lore_item = item
	v_box.add_child(lore)
	if !has_lore:
		has_lore = true
		label.queue_free()
	
const LORE = preload("uid://bo613a3fi03e3")
