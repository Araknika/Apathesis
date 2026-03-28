extends Button
@onready var notes_tab: TabContainer = $"../.."

func _on_pressed() -> void:
	notes_tab.current_tab = 0
