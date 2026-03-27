extends Button

@onready var tab_container: TabContainer = $"../../../.."

func _on_pressed() -> void:
	SignalHandler.journal_add.emit()
	tab_container.current_tab = 0
