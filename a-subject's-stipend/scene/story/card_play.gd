extends Node2D
@onready var card_down: AnimatedSprite2D = $CardDown
@onready var card_button: TextureButton = $CardButton
@onready var animation: AnimationPlayer = $Preview/animation
@onready var background: TextureRect = $Background
@onready var panel: Control = $Control
@onready var event_sfx: AudioStreamPlayer = $event_sfx
@onready var event_sfx_2: AudioStreamPlayer = $event_sfx2
@onready var music: AudioStreamPlayer = $event_sfx3
@onready var title: RichTextLabel = $Control/title
@onready var body: RichTextLabel = $Control/body
@onready var img = $Preview/img

var Data = SituationData.new()

signal finish

func _process(delta: float) -> void:
	if Data.img != "":
		img.texture = load(Data.img)
	title.text = Data.title
	body.text = Data.body

func _ready() -> void:
	card_button.hide()
	card_down.hide()
	background.hide()
	panel.hide()
	
	hide()
	#card_down.show()
	#await card_place() #test!


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
	animation.play("slide")
	
	event("Servants")
	
	await animation.animation_finished
	music.play()
	card_button.hide()

func event(area):
	
	randomize()
	var chance = randf()
	
	chance = 0.6
	match area:
		"Servants":
			Data.servant(chance)


func EmergencyFundAccess() -> void:
	hide()
	
	emit_signal("finish")
