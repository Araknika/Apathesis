extends Node

var health := 5

var sound_player = null

func _ready() -> void:
	signal_connect()

func signal_connect():
	SignalHandler.hp_add.connect(health_update.bind(0, "add"))
	SignalHandler.hp_sub.connect(health_update.bind(0,"sub"))
	SignalHandler.hp_set.connect(health_update.bind("set"))


func health_update(value: int, change_type: String):
	var temp = health
	if value > 0:
		health = value
	if change_type == "add":
		health += 1
	if change_type == "sub":
		health -= 1
	SignalHandler.hp_update.emit()
	
	if PlayerData.health > temp:
		sound_player.stream = load("res://Assets/Sounds/Effects/UI/heal.wav")
		sound_player.play()
	if PlayerData.health < temp:
		sound_player.stream = load("res://Assets/Sounds/Effects/UI/hurt.wav")
		sound_player.play()
