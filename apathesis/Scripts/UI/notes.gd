extends MarginContainer


@onready var v_box: VBoxContainer = $VBoxContainer

func _ready() -> void:
	SignalHandler.note_add.connect(new_note)

func new_note(item:ItemData):
	var note = load("uid://ct7mmpvxtosq0").instantiate()
	note.note_item = item
	v_box.add_child(note)
