@tool
extends ItemData
class_name Weapons

@export var damage: int
@export var damage_type: dmg_type

enum dmg_type {PHYS, CHAOS, MAGIC}
