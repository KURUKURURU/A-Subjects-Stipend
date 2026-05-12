extends Node2D
@onready var settings_img: TextureRect = $SettingsBanner/img
@onready var settings_hover: TextureButton = $SettingsBanner/hover
@onready var settings_animation: AnimationPlayer = $SettingsBanner/animation
@onready var settings_banner: Sprite2D = $SettingsBanner
@onready var questbox: Control = $Questbox
@onready var textbox: Control = $Textbox
@onready var audio: AudioStreamPlayer2D = $SettingsBanner/audio

func _ready() -> void:
	
	await Speak("You", "For love is as strong as death is, And exclusive devotion is as unyielding as the Grave.")
	await questbox.startQuest("Sigma Challenge!")
	await Speak("You", "Marigold is the name for a gold and beautifully orange flower found in humid and arid places, and is a sign of great wealth.")
	
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass

func Speak(n, m):
	await textbox.Speak(n, m)

func onHover() -> void:
	print_debug()
	audio.play()
	settings_animation.play("down")


func offHover() -> void:
	audio.play()
	settings_animation.play("up")
