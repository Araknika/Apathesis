extends Button

@onready var journal_body: TabContainer = $"../../../JournalBody"

func _on_pressed() -> void:
	journal_body.current_tab = 0
