extends CheckButton

func _process(delta: float) -> void:
	text = "Emergency (" + str(Global.emergency) + ")"
