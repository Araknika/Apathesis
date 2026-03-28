extends TabContainer

@onready var inv_button: Button = $"../ActionPages/HBoxContainer/InvButton"
@onready var equip_button: Button = $"../ActionPages/HBoxContainer/EquipButton"
@onready var magic_button: Button = $"../ActionPages/HBoxContainer/MagicButton"
@onready var journal_button: Button = $"../ActionPages/HBoxContainer/JournalButton"


func _on_inv_button_pressed() -> void:
	self.current_tab = 0


func _on_equip_button_pressed() -> void:
	pass # Replace with function body.


func _on_magic_button_pressed() -> void:
	pass # Replace with function body.


func _on_journal_button_pressed() -> void:
	self.current_tab = 1
