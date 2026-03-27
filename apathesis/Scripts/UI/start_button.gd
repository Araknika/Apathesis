extends Button

@onready var screen: SubViewportContainer = $"../MarginContainer/Control/SubViewportContainer"
@onready var logo: RichTextLabel = $"../RichTextLabel"

func _on_pressed() -> void:
	SignalHandler.game_start.emit()
	screen.visible = true
	logo.visible = false
	queue_free()
