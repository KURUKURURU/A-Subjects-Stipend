extends Node2D

@onready var front_2: TextureRect = $front2
@onready var title: RichTextLabel = $title
@onready var message: RichTextLabel = $message
@onready var animation: AnimationPlayer = $animation

var showing := false
signal fin
	
func _ready() -> void:
	self.hide()
	pass
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space") and visible:
		self.hide()
		emit_signal("fin")
	
func popup(word: String, def: String) -> void:
	get_viewport().gui_release_focus()
	title.text = word
	message.text = def
	
	self.show()
	animation.play("fadein")
	await animation.animation_finished
	get_viewport().gui_release_focus()
	
	await fin
	return
