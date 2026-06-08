extends Node2D
@onready var smack: AudioStreamPlayer = $smack
@onready var month_1: HBoxContainer = $VBoxContainer/Month_1
@onready var month_2: HBoxContainer = $VBoxContainer/Month_2
@onready var month_3: HBoxContainer = $VBoxContainer/Month_3
@onready var month_4: HBoxContainer = $VBoxContainer/Month_4
@onready var month_5: HBoxContainer = $VBoxContainer/Month_5
@onready var month_6: HBoxContainer = $VBoxContainer/Month_6
@onready var _continue: Button = $Continue
@onready var final_tally = $summary
@onready var extras = $Extras
@onready var summary: HBoxContainer = $summary

func _ready() -> void:
	
	final_tally.hide()
	_continue.hide()
	extras.hide()
	
	for i in range(6):
		var month_node = $VBoxContainer.get_node("Month_" + str(i + 1))
		month_node.visible = false
	
	await Fade.fade("out")
	await reveal()


func _process(delta: float) -> void:
	pass

func reveal():
	for i in range(Global.month):
		await Global.wait(0.5)

		var month_node = $VBoxContainer.get_node("Month_" + str(i + 1))
		month_node.visible = true
		smack.play()
		
	await Global.wait(0.5)
	smack.play()
	_continue.show()
	final_tally.show()
	extras.show()


func complete() -> void:
	await Fade.fade("in")
	
	if summary.percentage == "100%":
		Global.goal == false
		get_tree().change_scene_to_file("res://scene/story/end.tscn")
	else:
		Global.goal == true
		get_tree().change_scene_to_file("res://scene/story/end.tscn")
