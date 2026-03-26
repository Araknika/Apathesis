@tool
extends Resource
class_name ItemData

@export var item_name : String
@export var item_type : Type
@export_multiline var item_description: String
@export var pickup_text : String
@export var item_texture : Texture2D
@export var context: int = 0

func _validate_property(property: Dictionary):
	if property.name == "context":
		property.hint = PROPERTY_HINT_FLAGS
		property.hint_string = ",".join(context_options.keys())
	

enum Type {WEAPON, ARMOR, KEY, CONSUMABLE}

enum context_options {
	USE= 1 << 0,
	EQUIP = 1 << 1,
	CAST = 1 << 2,
	EAT= 1 << 3,
	DRINK = 1 << 4,
	INSPECT = 1 << 5,
	DROP = 1 << 6,
}
