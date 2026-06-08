extends Node2D
@onready var ui: Node2D = $UI
@onready var textbox = $UI/Textbox
@onready var the_palace: AudioStreamPlayer = $the_palace
@onready var filter: TextureRect = $filter
@onready var sad = $sad
@onready var zoom = $zoom
@onready var music = AudioServer.get_bus_index("Music")
@onready var girl: AnimatedSprite2D = $zoom/girl



func _ready() -> void:
	
	AudioServer.set_bus_volume_db(music, -80.0)
	
	await Fade.fade("out")
	await zoom.animation_finished
	# Have a derpy you face

	#musicfade()
			
	#sad.play()
	#await Speak("Crown Princess Marigold", "Viorel. You need a job.")
	await Speak("Crown Princess Marigold", "...")
	
	await reaction(Global.goal)
	
	await Fade.fade("in")
	Loader.change_level("res://scene/story/start_menu.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func musicfade():
	for i in range(60):
		await Global.wait(0.02)
		AudioServer.set_bus_volume_db(music, -60 + (i)) # Lower volume by 10dB

func Speak(n, m):
	if !(m == "..." or n == "You"):
		Animate()
		
	await textbox.Speak(n,m) 

func Animate():
	girl.play("talk")
	await textbox.animation.animation_finished
	await  Global.wait(1)
	girl.play("default")

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

@onready var img: TextureRect = $Windowww/img
@onready var animate: AnimationPlayer = $Windowww/animate
@onready var smack: AudioStreamPlayer = $Windowww/smack
@onready var celebration: AudioStreamPlayer = $Windowww/celebration
@onready var wrong: AudioStreamPlayer = $Windowww/wrong
@onready var sadness: AudioStreamPlayer = $Windowww/sadness


func reaction(condition):
	
	match condition:
		
		true:
			img.texture = load("res://img/situations/bod.png")
			celebration.play()
			animate.play("fadein")
			await animate.animation_finished
			
			await Speak("Crown Princess Marigold", "I knew you could do it!")
			smack.play()
			img.texture = load("res://img/situations/hand.png")
			await Global.wait(2.0)
			
			
			await Speak("Crown Princess Marigold", "[tornado]Great Job!!")
			await Global.wait(0.5)
			
			
			
		false:
			img.texture = load("res://img/situations/pic2.png")
			
			animate.play("fadein")
			await animate.animation_finished
			sadness.play()
			await Speak("Crown Princess Marigold", "I can't believe it...")
			await Speak("Crown Princess Marigold", "I thought you could manage it...")
			await Global.wait(2.0)
			
			wrong.play()
			img.texture = load("res://img/situations/pic1.png")
			await Global.wait(1.5)
			await Speak("Crown Princess Marigold", "My plans... ruined...")
			await Global.wait(2.5)
			
