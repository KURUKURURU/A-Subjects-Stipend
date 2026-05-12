extends Node2D
@onready var scroll_bg: Parallax2D = $ScrollBG
@onready var messagebg: TextureRect = $messagebg
@onready var vines: TextureRect = $vines
@onready var filter: TextureRect = $filter
@onready var message: RichTextLabel = $message
@onready var message_animation: AnimationPlayer = $message/message_animation
@onready var animation: AnimationPlayer = $animation
@onready var music: AudioStreamPlayer = $Music
@onready var sfx: AudioStreamPlayer = $sfx
@onready var darkcolor: ColorRect = $darkcolor

signal advance

func _ready() -> void:
	await Speak("Crown Princess Marigold, 
savior of the kingdom and 
holder of the silver sword.")
	await Speak("AMBERWOOD, 
kingdom of honey.

–A kingdom revered for its beauty.")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		emit_signal("advance")


func Speak(m: String):
	self.show()
	
	message.bbcode_enabled = true
	message.text = "[shake rate=10 level=5]" + m
	
	sfx.play()
	message_animation.play("text")
	await message_animation.animation_finished
	message.text = m
	message.bbcode_enabled = false
	
	await advance
	message.text = ""
	
