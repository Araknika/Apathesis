extends MarginContainer

@onready var message_log: RichTextLabel = $MessageLog
@onready var message_noise: AudioStreamPlayer2D = $MessageLog/AudioStreamPlayer2D
@onready var tab_container: TabContainer = $".."

func _ready() -> void:
	SignalHandler.message_send.connect(add_message)
	item_signals()

#Adds new messages to the log
func add_message(text: String):
	tab_container.current_tab = get_index()
	message_log.append_text("\n-" + text)
	message_noise.play()
	
	#Scrolls to bottom
	await get_tree().process_frame
	message_log.scroll_to_line(message_log.get_line_count())
	
	#Counts lines and limits if above a value
	var lines = message_log.get_line_count()
	if lines > 10:
			line_limit()

# Item Logic
func item_signals():
	SignalHandler.description_send.connect(add_description_message)

func add_description_message(text: String):
	message_log.append_text("\n-" + text)
	message_noise.play()

#Limits how many messages can exist at once by deleting the oldest ones
func line_limit(): 
	var first_newline = message_log.text.find("\n")
	if first_newline != -1:
		message_log.text = message_log.text.substr(first_newline + 1)
