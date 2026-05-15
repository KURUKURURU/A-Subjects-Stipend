extends Node2D

var page 

func _ready() -> void:
	AlertMessage.Alert("You must budget your finances efficiently and prepare well.")
	await AlertMessage.accept_message
	

func _process(delta: float) -> void:
	pass
	



func Transition() -> void:
	pass # Replace with function body.
