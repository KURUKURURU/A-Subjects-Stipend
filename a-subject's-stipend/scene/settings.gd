extends TextureButton
@onready var animation: AnimationPlayer = $animation


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	animation.play("tilt_right")


func _on_mouse_exited() -> void:
	animation.play("tilt_left")
