extends Node2D

func _ready() -> void:
	NodeHandler.itemlayer = self
	spawn_items()
	
@onready var room_1: Node2D = $"../Rooms/Room1"
@onready var room_2: Node2D = $"../Rooms/Room2"
@onready var room_3: Node2D = $"../Rooms/Room3"
@onready var room_4: Node2D = $"../Rooms/Room4"
@onready var room_5: Node2D = $"../Rooms/Room5"
@onready var room_6: Node2D = $"../Rooms/Room6"
@onready var room_7: Node2D = $"../Rooms/Room7"

const TORN_NOTE = preload("uid://b8rv1xuamgwa0")
const JAGGED_KEY = preload("uid://da6k0aavvr17l")

func spawn_items():
	spawn1()
	spawn2()
	
func spawn1():
	var item_scene = preload("res://Resources/Items/NewItem.tscn").instantiate()
	item_scene.data = TORN_NOTE
	room_1.add_child(item_scene)
	item_scene.global_position = $Itemspawner1.global_position

func spawn2():
	var item_scene = preload("res://Resources/Items/NewItem.tscn").instantiate()
	item_scene.data = JAGGED_KEY
	room_3.add_child(item_scene)
	item_scene.global_position = $Itemspawner2.global_position
