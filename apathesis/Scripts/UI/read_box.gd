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
var stored_index: int = -1

func define_note(item:ItemData, index:int):
	stored_note = item
	stored_index = index

func send_note():
	SignalHandler.note_add.emit(stored_note, stored_index)
	SignalHandler.message_send.emit("YOU COPY THE " + stored_note.item_name +" INTO YOUR JOURNAL. (QUEST UPDATED)")
	if stored_note as Texts and stored_note.quest_text != null:
		SignalHandler.quest_update.emit(stored_note.quest_text)
