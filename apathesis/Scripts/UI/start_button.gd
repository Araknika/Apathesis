extends Button

@onready var logo: RichTextLabel = $"../RichTextLabel"
@onready var screen: SubViewportContainer = $"../../MarginContainer/Control/SubViewportContainer"

func _on_pressed() -> void:
	SignalHandler.game_start.emit()
	screen.visible = true
	logo.visible = false
	queue_free()
