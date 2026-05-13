extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	await Fade.fade("out")
	await Global.wait(3.0)
	await Fade.fade("in")
	get_tree().change_scene_to_file("")
