extends TextureProgressBar
@onready var amount: RichTextLabel = $amount
@onready var minus: TextureButton = $minus
@onready var plus: TextureButton = $plus
@onready var label: RichTextLabel = $label

@onready var _ScrollContainer: ScrollContainer = $"../ScrollContainer"

 
func _ready() -> void:
	self.value = 0
	plus.pressed.connect(adding)
	minus.pressed.connect(subtracting)


func _process(delta: float) -> void:
	amount.text = str(self.value)

func adding():
	var frank = self
	_ScrollContainer.adding(frank)
	
func subtracting():
	var frank = self
	_ScrollContainer.subtracting(frank)
	
