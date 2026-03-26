extends Node

signal message_send(text:String)

# UI world action signals
signal action_interact
signal action_open
signal action_look
signal action_inspect

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

# Sound Signals
signal play_song(text:String)


# Debug Signals
signal debug1
signal debug2
signal debug3
