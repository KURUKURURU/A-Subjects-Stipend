extends CanvasLayer
@onready var tug: TextureButton = $Banners/Tug
@onready var anim: AnimationPlayer = $Banners/Tug/anim
@onready var side: TextureRect = $Banners/Side
@onready var main: TextureRect = $Banners/Main
@onready var banners: AnimationPlayer = $Banners
@onready var sfx: AudioStreamPlayer2D = $sfx
@onready var tmessage: RichTextLabel = $Banners/Main/message

signal accept_message

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func Alert(message:String):
	tmessage.text = message
	sfx.play()
	banners.play("down")
	await banners.animation_finished
	
	sfx.play()
	anim.play("down")
	await anim.animation_finished

func HoverStart() -> void:
	if anim.is_playing():
		if anim.current_animation == "tug":
			anim.play("tug")


func Tug() -> void:
	sfx.play()
	anim.play("up")
	await Global.wait(0.5)
	
	sfx.play()
	banners.play("up")
	await banners.animation_finished
	emit_signal("accept_message")
