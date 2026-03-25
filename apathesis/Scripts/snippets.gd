extends Node

# MESSAGE HEX CODES
	#DEEP PURPLE #700f46

# MESSAGE SIGNAL EMIT
	#SignalHandler.message_send.emit("text")

# LOOK TEXT - CONNECT TO THE LOOK SIGNAL
	#func look():
	#	SignalHandler.message_send.emit("THE AIR IS STALE AND SMELLS FAINTLY OF SOMETHING UNPLACABLE")
	
	#CONNECT
		#SignalHandler.action_look.connect(look)



#ENTIRE OLD SLOT CODE
#extends Panel
#
#@onready var icon: TextureRect = $Icon
#
#
## DRAG LOGIC
#func _get_drag_data(_at_position: Vector2) -> Variant:
	#if icon.texture == null:
		#return
	#
	#var preview = duplicate()
	#var c = Control.new()
	#c.add_child(preview)
	#preview.position -= Vector2(23,23)
	#preview.self_modulate = Color.TRANSPARENT
	#c.modulate = Color(c.modulate, 0.5)
	#
	#set_drag_preview(c)
	#return icon
#
## DROP LOGIC
#func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	#return true
#
#func _drop_data(at_position: Vector2, data: Variant) -> void:
	#var tmp = icon.texture
	#icon.texture = data.texture
	#data.texture = tmp
