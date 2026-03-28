extends Button
@onready var lore_tab: TabContainer = $"../.."

func _on_pressed() -> void:
	lore_tab.current_tab = 0
