extends Control
@onready var message: RichTextLabel = $message
@onready var title : RichTextLabel = $name
@onready var animation: AnimationPlayer = $animation
@onready var sfx: AudioStreamPlayer2D = $sfx
@onready var animation_2: AnimationPlayer = $animation2

signal advance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("click"):
		emit_signal("advance")
	
	pass

func Speak(n: String, m: String):
	self.show()
	animation_2.play("jump")
	
	message.bbcode_enabled = true
	message.text = "[shake rate=10 level=5]" + m
	title.text = n
	
	sfx.play()
	animation.play("text")
	await animation.animation_finished
	message.text = m
	message.bbcode_enabled = false
	
	await advance
	self.hide()
	
