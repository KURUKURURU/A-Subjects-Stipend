extends Node2D
@onready var animation: AnimationPlayer = $animation
@onready var paper = $Paper
@onready var txt: RichTextLabel = $Paper/txt
@onready var img: TextureRect = $Paper/img
@onready var stretch: AudioStreamPlayer = $stretch
@onready var fade: TextureRect = $fade
@onready var fadetxt: RichTextLabel = $fade/RichTextLabel
@onready var fadeanimation: AnimationPlayer = $fade/RichTextLabel/AnimationPlayer
@onready var q_1: HBoxContainer = $fade/Q1
@onready var q_2: HBoxContainer = $fade/Q2
@onready var wrong: AudioStreamPlayer = $wrong
@onready var right: AudioStreamPlayer = $right

signal close

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await Fade.fade("out")
	await roll("Do you know how this kingdom's credit debt is calculated?", "")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_accept"):
		#emit_signal("close")
	pass
	
func roll(words, imgs):
	
	txt.text = words
	#img.texture = imgs
	paper.show()
	
	stretch.play()
	animation.play("roll_out")
	await animation.animation_finished
	
	await close
	animation.play("roll_in")
	await animation.animation_finished
	
	paper.hide()
	


func _on_y_pressed() -> void:
	Loader.change_level("res://scene/story/budgeting.tscn")


func _on_n_pressed() -> void:
	Loader.change_level("res://scene/story/info_session.tscn")
