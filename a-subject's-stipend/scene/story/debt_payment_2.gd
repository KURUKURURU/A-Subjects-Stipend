extends TextureProgressBar
@onready var amount: RichTextLabel = $amount
@onready var minus: TextureButton = $minus
@onready var plus: TextureButton = $plus
@onready var label: RichTextLabel = $label

@onready var _ScrollContainer: ScrollContainer = $"../ScrollContainer"
@onready var bad: AudioStreamPlayer = $"../ScrollContainer/bad"

 
func _ready() -> void:
	self.value = 0
	plus.pressed.connect(adding)
	minus.pressed.connect(subtracting)


func _process(delta: float) -> void:
	amount.text = str(self.value)

func adding():
	var frank = self
	if value != 1000:
		_ScrollContainer.adding(frank)
	else:
		bad.play()
	
func subtracting():
	var frank = self
	if value != 0:
		_ScrollContainer.subtracting(frank)
	else:
		bad.play()
	
