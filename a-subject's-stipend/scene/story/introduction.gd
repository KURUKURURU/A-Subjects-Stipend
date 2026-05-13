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
	await Speak("AMBERWOOD, 
kingdom of honey.

–A kingdom revered for its beauty.")

	await Speak("a testament to this beauty 
would be the kingdom's castle,
dubbed the \"FIREGARDEN\".")
	
	await Speak("Here lies the charming and intelligent [wave]CROWN PRINCESS[/wave], 

savior of the kingdom and 
holder of the silver sword.")

	await Speak("You are loyal to her, 
as you are one of her subjects.")

	await Speak("Though it also helps that
you were her close friend in childhood, 

despite you being a poor lowly noble.")

	await Speak("It truly shows how amazing
and humble our crown princess is.

You would know though, [wave]as her childhood friend.")

	await Speak("~~~")
	await Speak("Enjoy this upcoming journey,
	and whatever else awaits you.

your PRINCESS has called for you.")
	
	animation.play("end")
	await animation.animation_finished
	
	get_tree().change_scene_to_file("res://scene/story/Start.tscn")
	
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
	#message.bbcode_enabled = false
	
	await advance
	message.text = ""
	
