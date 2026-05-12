extends Sprite2D
@onready var mask: TextureButton = $hover
@onready var animation: AnimationPlayer = $animation
@onready var img: TextureRect = $img

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func onHover() -> void:
	print_debug()
	animation.play("down")


func offHover() -> void:
	animation.play("up")
