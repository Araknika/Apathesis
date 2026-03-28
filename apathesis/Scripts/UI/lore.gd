extends Control

@onready var button: Button = $Button
@onready var lore_tab: TabContainer = $"../../../.."
@onready var text_label: RichTextLabel = $"../../../../LoreText/RichTextLabel"

var lore_item: ItemData = null

func _ready() -> void:
	fill_lore(lore_item)

func fill_lore(item:ItemData):
	if item as Lore:
		button.text = item.lore_name

func _on_button_pressed() -> void:
	if lore_item as Lore:
		text_label.text = lore_item.page1
		lore_tab.current_tab = 1
