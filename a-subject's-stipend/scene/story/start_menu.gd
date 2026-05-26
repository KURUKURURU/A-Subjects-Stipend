extends Node2D
@onready var animation: AnimationPlayer = $Node2D/animation
@onready var texture_button: TextureButton = $Node2D/TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	animation.play("in")
	await animation.animation_finished
	
	#await Global.wait(1)
	await Fade.fade("in")
	get_tree().change_scene_to_file("res://scene/story/introduction.tscn")
