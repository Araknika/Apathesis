extends Control

@onready var button: Button = $Button
@onready var rich_text_label: RichTextLabel = $"../../../NoteText/RichTextLabel"
@onready var notes_tab: TabContainer = $"../../.."

var note_item: ItemData = null

func _ready() -> void:
	fill_note(note_item)

func fill_note(item:ItemData):
	button.text = item.item_name

func _on_button_pressed() -> void:
	if note_item as Texts:
		rich_text_label.text = note_item.read_text
		notes_tab.current_tab = 1
