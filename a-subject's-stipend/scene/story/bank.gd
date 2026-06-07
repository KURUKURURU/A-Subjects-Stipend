extends TextureProgressBar
@onready var label: RichTextLabel = $label


func _ready() -> void:
	#Global.owed = 3000
	pass


func _process(delta: float) -> void:
	label.text = str(Global.current_principal) + " principal left!"
