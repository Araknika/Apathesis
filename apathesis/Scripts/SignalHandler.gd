extends Node

signal message_send(text:String)

# UI world action signals
signal action_interact
signal action_open
signal action_look
signal action_inspect

# UI data signals
signal hp_add
signal hp_sub
signal hp_set(int)
signal hp_update

# Inventory Signals
signal inventory_update

# Item Signals
signal name_pull
signal type_pull
signal description_pull
signal name_send(text:String)
signal type_send(text:String)
signal description_send(text:String)

# Sound Signals
signal play_song(text:String)
