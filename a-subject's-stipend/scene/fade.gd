extends Node2D
@onready var animation: AnimationPlayer = $animation
@onready var darkcolor: ColorRect = $darkcolor

func _ready() -> void:
	self.hide()

func fade(name:String):
	self.show()
	animation.play(name)
	await animation.animation_finished
	self.hide()
