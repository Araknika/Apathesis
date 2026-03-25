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

# FUCKASS SLOT CONTEXT BULLSHIT
#@onready var context_menu: PopupMenu = $ContextMenu
#
#func _on_icon_gui_input(event: InputEvent) -> void:
	#if item and hovered and event is InputEventMouseButton and event.button_index == (MOUSE_BUTTON_RIGHT) and event.pressed:
		#prepare_menu(item)
		#context_menu.popup(Rect2(get_global_mouse_position(), Vector2.ZERO))
#
#func prepare_menu(data: ItemData):
	#pass
#
#func _on_context_menu_id_pressed(id: int) -> void:
	#match id:
		#0:
			#SignalHandler.description_send.emit(item.item_description)
