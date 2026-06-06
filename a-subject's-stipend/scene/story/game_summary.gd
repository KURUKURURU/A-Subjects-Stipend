extends Node2D
@onready var smack: AudioStreamPlayer = $smack
@onready var month_1: HBoxContainer = $VBoxContainer/Month_1
@onready var month_2: HBoxContainer = $VBoxContainer/Month_2
@onready var month_3: HBoxContainer = $VBoxContainer/Month_3
@onready var month_4: HBoxContainer = $VBoxContainer/Month_4
@onready var month_5: HBoxContainer = $VBoxContainer/Month_5
@onready var month_6: HBoxContainer = $VBoxContainer/Month_6
@onready var month_7: HBoxContainer = $VBoxContainer/Month_7
@onready var month_8: HBoxContainer = $VBoxContainer/Month_8
@onready var month_9: HBoxContainer = $VBoxContainer/Month_9
@onready var month_10: HBoxContainer = $VBoxContainer/Month_10
@onready var month_11: HBoxContainer = $VBoxContainer/Month_11
@onready var month_12: HBoxContainer = $VBoxContainer/Month_12
@onready var _continue: Button = $Continue
@onready var final_tally = $summary
@onready var extras = $Extras

func _ready() -> void:
	
	final_tally.hide()
	_continue.hide()
	extras.hide()
	
	for i in range(12):
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
