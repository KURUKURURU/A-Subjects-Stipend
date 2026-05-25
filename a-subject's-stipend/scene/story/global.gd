extends Node

var owed : int

var month #1-12


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
