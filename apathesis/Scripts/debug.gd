extends Node

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("test1"):
		SignalHandler.play_song.emit("Explore 1")
		
	if Input.is_action_just_pressed("test2"):
		SignalHandler.hp_add.emit()
		
	if Input.is_action_just_pressed("test3"):
		SignalHandler.hp_sub.emit()
		
	if Input.is_action_just_pressed("test4"):
		SignalHandler.debug1.emit()
		
	if Input.is_action_just_pressed("test5"):
		SignalHandler.debug2.emit()
		
	if Input.is_action_just_pressed("test6"):
		SignalHandler.debug3.emit()
