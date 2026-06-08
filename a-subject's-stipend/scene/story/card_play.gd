extends Node2D
@onready var card_down: AnimatedSprite2D = $CardDown
@onready var card_button: TextureButton = $CardButton
@onready var animation: AnimationPlayer = $Preview/animation
@onready var background: TextureRect = $Background
@onready var panel: Control = $Control
@onready var event_sfx: AudioStreamPlayer = $event_sfx
@onready var event_sfx_2: AudioStreamPlayer = $event_sfx2
@onready var music: AudioStreamPlayer = $event_sfx3
@onready var title: RichTextLabel = $Control/setting/title
@onready var body: RichTextLabel = $Control/setting/body
@onready var img = $Preview/img
@onready var control: Control = $Control
@onready var pre: Control = $Preview
@onready var add: Control = $Control/setting/Add

@onready var take: Control = $Control/setting/Take
@onready var emergency_option: CheckButton = $Control/setting/Take/Emergency
@onready var credit_option: CheckButton = $Control/setting/Take/Credit
@onready var accept_option: TextureButton = $Control/setting/Take/accept

@onready var preview_title: RichTextLabel = $Preview/title
@onready var preview_body: RichTextLabel = $Preview/body

#var Data = SituationData.new()
var payment:
	get:
		return SituationData.payment

signal finish
signal complete_payment

func _process(delta: float) -> void:
	
	if Global.emergency == 0:
		emergency_option.disabled = true
		if credit_option.button_pressed == true:
			accept_option.disabled = false
		else:
			accept_option.disabled = true
		
	
	
	if SituationData.img != "":
		img.texture = load(SituationData.img)
	
	title.text = SituationData.title
	preview_title.text = SituationData.title
	body.text = SituationData.body
	preview_body.text = SituationData.body
	
	

func _ready() -> void:
	finished()

func finished():
	control.hide()
	animation.play("RESET")
	card_button.hide()
	card_down.hide()
	background.hide()
	panel.hide()
	music.stop()
	pre.hide()
	
	hide()

func card_place():
	event_sfx.play()
	card_button.hide()
	card_down.show()
	
	card_down.play("default")
	await card_down.animation_finished
	
	card_down.hide()
	card_button.show()
	return

func click():
	await event("Servants")
	event_sfx_2.play()
	background.show()
	pre.show()
	animation.play("slide")
	
	#event("Servants")
	
	await animation.animation_finished
	music.play()
	card_button.hide()

func event(area):

	randomize()
	var chance = randf()

	match area:
		"Servants":
			SituationData.situation(chance)

	print("Payment =", SituationData.payment)
	print("Global.added BEFORE =", Global.added)

	if SituationData.payment >= 0:
		Global.added += SituationData.payment
		add.show()
		take.hide()
	else:
		SituationData.payment = abs(SituationData.payment)
		pick_payment()
		
	print("Global.added AFTER =", Global.added)

func pick_payment():
	add.hide()
	take.show()
	
	#payment = abs(payment)
	
	await complete_payment
	var need_to_pay = payment
	
	if emergency_option.button_pressed == true:
		need_to_pay -= Global.emergency
		Global.emergency -= payment
		
	if credit_option.button_pressed == true:
		Global.current_principal += need_to_pay
	
	emit_signal("finish")
	finished()
	
func EmergencyFundAccess() -> void:
	emit_signal("finish")
	finished()


func _on_accept_pressed() -> void:
	emit_signal("finish")
	finished()


func _complete_payment() -> void:
	emit_signal("complete_payment")
	
