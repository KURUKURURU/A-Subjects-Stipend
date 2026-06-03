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
	Global.owed = 3000
	
	AudioServer.set_bus_volume_db(music, -80.0)
	
	await Fade.fade("out")
	await zoom.animation_finished
	# Have a derpy you face

	for i in range(60):
		await Global.wait(0.02)
		AudioServer.set_bus_volume_db(music, -60 + (i)) # Lower volume by 10dB
			
	sad.play()
	await Speak("Crown Princess Marigold", "Viorel. You need a job.")
	
	# Have a view of mari from afar crosshanded
	await Speak("Crown Princess Marigold", "A common noble like you should have better spending habits, it worries me how you've dug yourself this deep.")
	await Speak("Crown Princess Marigold", "You have the worst [wave]REDCARD debt[/wave] in the kingdom. I'm not kidding.")
	await Speak("Crown Princess Marigold", "Credit card debt is something I expected from your character, but when I heard of your situation I was still surprised.")
	await Speak("Crown Princess Marigold", "Fear not, I won't let you continue this. I command you, in under a year, [shake][font_size=25]to pay your debt.")
	await Speak("Crown Princess Marigold", "...")
	
	await Speak("Crown Princess Marigold", "[font_size=12][wave] If he can just pay them, he'd be a suitable match for me, a crown princess...")
	
	# he looks up smiling
	Questbox.startQuest("Debt")
	await Speak("You","Yes, my Princess. I'll do as you say.")
	
	await Speak("Crown Princess Marigold","Do your best, and do it for me. To loose your debt, you must spend wisely and think about the future.")
	await Speak("Crown Princess Marigold","Don't fall back onto your old habits.")
	
	await Fade.fade("in")
	get_tree().change_scene_to_file("res://scene/story/info_session.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
