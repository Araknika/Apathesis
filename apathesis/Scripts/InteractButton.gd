extends Button

func _on_pressed() -> void:
	SignalHandler.action_interact.emit()
