extends Node2D
@onready var animation: AnimationPlayer = $Node2D/animation
@onready var texture_button: TextureButton = $Node2D/TextureButton
@onready var _Window: Control = $Window
@onready var back: TextureButton = $Window/Back
@onready var labeling: RichTextLabel = $labeling
@onready var story: Area2D = $Story
@onready var gameplay: Area2D = $Gameplay
@onready var start_with_gameplay: Button = $"VBoxContainer/Start-with-Gameplay"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	labeling.text = "..."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func start() -> void:
	animation.play("in")
	await animation.animation_finished
	
	#await Global.wait(1)
	await Fade.fade("in")
	Loader.change_level("res://scene/story/introduction.tscn")


func _on_start_pressed() -> void:
	await Fade.fade("in")
	Loader.change_level("res://scene/story/introduction.tscn")


func _on_startwith_gameplay_pressed() -> void:
	await Fade.fade("in")
	get_tree().change_scene_to_file("res://scene/story/doYouKnow.tscn")


func _on_back_pressed() -> void:
	_Window.hide()


func _on_credits_pressed() -> void:
	_Window.show()


func starton() -> void:
	labeling.text = "Game starts with the introduction cutscene."
	
func gameplayon():
	labeling.text = "Skips the introduction cutscene."

func exit():
	labeling.text = "..."
