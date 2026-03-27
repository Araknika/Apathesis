extends MarginContainer

@onready var readtext: RichTextLabel = $ReadText
@onready var tab_container: TabContainer = $".."

func _ready() -> void:
	SignalHandler.read_send.connect(add_text)
	SignalHandler.note_data.connect(define_note)
	SignalHandler.journal_add.connect(send_note)

func add_text(text:String):
	tab_container.current_tab = get_index()
	readtext.text = text

var stored_note: ItemData = null

func define_note(item:ItemData):
	stored_note = item

func send_note():
	SignalHandler.note_add.emit(stored_note)
