extends MarginContainer

@onready var readtext: RichTextLabel = $ReadText
@onready var tab_container: TabContainer = $".."

func _ready() -> void:
	SignalHandler.read_send.connect(add_text)

func add_text(text:String):
	tab_container.current_tab = get_index()
	readtext.text = text
