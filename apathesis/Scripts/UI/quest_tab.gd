extends MarginContainer

@onready var label: RichTextLabel = $RichTextLabel

func _ready() -> void:
	SignalHandler.quest_update.connect(add_text)

func add_text(text:String):
	label.text = text
