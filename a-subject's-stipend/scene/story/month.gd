extends RichTextLabel

func _process(delta: float) -> void:
	text = "Month " + str(Global.month) + "/6"
