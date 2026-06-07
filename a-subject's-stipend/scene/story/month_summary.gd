extends Node2D
@onready var earned: RichTextLabel = $Panel/Control/earned
@onready var debt: RichTextLabel = $Panel/Control/debt
@onready var before: RichTextLabel = $Panel/earn
@onready var after: RichTextLabel = $Panel/removed


func _ready() -> void:
	
	earned.text = str(Global.added) + " g"
	debt.text = str(Global.difference) + " g"
	
	before.text = str(Global.before) + " g"
	after.text = str(Global.after) + " g"
	
	

func _on_continue_pressed() -> void:
	Global.month += 1
	Loader.change_level("res://scene/story/budgeting.tscn")
