extends Node2D
@onready var settings_img: TextureRect = $SettingsBanner/img
@onready var settings_hover: TextureButton = $SettingsBanner/hover
@onready var settings_animation: AnimationPlayer = $SettingsBanner/animation
@onready var settings_banner: Sprite2D = $SettingsBanner

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func onHover() -> void:
	print_debug()
	settings_animation.play("down")


func offHover() -> void:
	settings_animation.play("up")
