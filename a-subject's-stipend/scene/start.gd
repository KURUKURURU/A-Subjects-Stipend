extends Node2D
@onready var ui: Node2D = $UI
@onready var textbox = $UI/Textbox
@onready var the_palace: AudioStreamPlayer = $the_palace
@onready var filter: TextureRect = $filter


func _ready() -> void:
	
	# Have a derpy you face
	await Speak("Crown Princess Marigold", "Viorel. You need a job.")
	
	# Have a view of mari from afar crosshanded
	await Speak("Crown Princess Marigold", "A common noble like you should have better spending habits, it worries me how you've dug yourself this deep.")
	await Speak("Crown Princess Marigold", "In this kingdom, there's should be no shame in being a working noble, at least from me.")
	
	await Speak("Crown Princess Marigold", "[font_size=12][wave] I just need him to become a suitable match for a crown princess...")
	
	# he looks up smiling
	await Speak("You","Yes, my Princess. I'll do everything you say.")
	await Speak("Crown Princess Marigold","Do your best, and do it for me. To loose your debt, you must spend wisely and think about the future.")
	await Speak("Crown Princess Marigold","Don't fall back onto your old habits.")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func Speak(n, m):
	await textbox.Speak(n,m)

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
