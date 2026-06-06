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

var Data = SituationData.new()
var payment = 0

signal finish

func _process(delta: float) -> void:
	if Data.img != "":
		img.texture = load(Data.img)
	title.text = Data.title
	
	body.text = Data.body
	payment = Data.payment
	

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
	event_sfx_2.play()
	background.show()
	pre.show()
	animation.play("slide")
	
	event("Servants")
	
	await animation.animation_finished
	music.play()
	card_button.hide()

func event(area):
	
	randomize()
	var chance = randf()
	
	match area:
		"Servants":
			Data.servant(chance)
			
	if Data.servant(chance):
		add.show()
		take.hide()
	else:
		take.show()
		add.hide()


func EmergencyFundAccess() -> void:
	emit_signal("finish")
	finished()


func _on_accept_pressed() -> void:
	emit_signal("finish")
	finished()
