extends RichTextLabel

var Data = SituationData.new()

func _process(delta: float) -> void:
	text = "Pay " + str(Data.payment) + " with..."
