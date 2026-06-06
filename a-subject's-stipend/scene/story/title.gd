extends RichTextLabel
@onready var card_play: Node2D = $"../../../.."


func _process(delta: float) -> void:
	text = "Pay " + str(card_play.payment) + " with..."
