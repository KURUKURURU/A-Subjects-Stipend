extends TextureProgressBar
@onready var label: RichTextLabel = $label


func _ready() -> void:
	Global.owed = 3000


func _process(delta: float) -> void:
	value = Global.owed
	label.text = str(int(value)) + " principal left!"
