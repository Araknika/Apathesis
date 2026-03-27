extends Node

func _ready() -> void:
	signals()

func signals():
	SignalHandler.game_start.connect(load_1)

func load_1():
	var SCREEN_1 = load("uid://uxemkllljr7d").instantiate()
	NodeHandler.screen.add_child(SCREEN_1)
