extends Node2D
@onready var card_down: AnimatedSprite2D = $CardDown
@onready var card_button: TextureButton = $CardButton


func _ready() -> void:
	card_button.hide()
	card_down.show()
	await card_place()


func card_place():
	card_button.hide()
	card_down.show()
	
	card_down.play("default")
	await card_down.animation_finished
	
	card_down.hide()
	card_button.show()
