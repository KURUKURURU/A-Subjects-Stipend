extends RichTextLabel

var Data = SituationData.new()

func _process(delta: float) -> void:
	text = str(Data.payment)
