extends MarginContainer

@onready var hp: Label = $HBoxContainer/VBoxContainer/HP
@onready var mp: Label = $HBoxContainer/VBoxContainer/MP

func _ready() -> void:
	change_healthbar()
	SignalHandler.hp_update.connect(change_healthbar)
	PlayerData.sound_player = $HPSound

func change_healthbar():
	hp.set_text("HP: " + str(PlayerData.health))
