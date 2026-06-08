extends TextureProgressBar
@onready var amount: RichTextLabel = $amount
@onready var minus: TextureButton = $minus
@onready var plus: TextureButton = $plus
@onready var label: RichTextLabel = $label

@onready var bad: AudioStreamPlayer = $"../../bad"


@onready var _ScrollContainer = $"../.."

var emergent

func _ready() -> void:
	if label.text == "Emergency Fund":
		emergent = true
		label.text = "Savings (" + str(Global.emergency) + " G)"
	
	self.value = 0
	plus.pressed.connect(adding)
	minus.pressed.connect(subtracting)


func _process(delta: float) -> void:
	amount.text = str(self.value)

func adding():
	var frank = self
	if value != 500 and !emergent:
		_ScrollContainer.adding(frank)
	elif value != 1000 and emergent:
		_ScrollContainer.adding(frank)
	else:
		bad.play()
	
func subtracting():
	var frank = self
	if value != 0:
		_ScrollContainer.subtracting(frank)
	else:
		bad.play()
	
