extends Node

# Main Signals
signal game_start

# UI Signals
signal action_interact
signal action_take
signal message_send(text:String)
signal note_add(item:ItemData)
signal note_data(item:ItemData)
signal journal_add

# Player Signals
signal PlayerPos_pull
signal PlayerPos_send(Vector2)
signal hp_add
signal hp_sub
signal hp_set(int)
signal hp_update

# Inventory Signals
signal inventory_update
signal context_start
signal slot_index(int)

# Item Signals
signal name_pull
signal type_pull
signal description_pull
signal name_send(text:String)
signal type_send(text:String)
signal description_send(text:String)
signal read_send(text:String)

# Sound Signals
signal play_song(text:String)

# Debug Signals
signal debug1
signal debug2
signal debug3
