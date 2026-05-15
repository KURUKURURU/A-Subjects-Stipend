extends Control
@onready var img: TextureRect = $img
@onready var progressbar: TextureProgressBar = $progressbar
@onready var sfx: AudioStreamPlayer2D = $sfx
@onready var animation: AnimationPlayer = $animation


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func startQuest(title: String):
	sfx.play()
	animation.play("down")
	
