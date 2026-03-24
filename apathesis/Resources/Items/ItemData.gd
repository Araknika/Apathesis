extends Resource

class_name ItemData

enum Type {WEAPON, ARMOR, KEY, CONSUMABLE}

@export var item_name : String
@export var item_type : Type
@export_multiline var item_description: String
@export var item_texture : Texture2D
