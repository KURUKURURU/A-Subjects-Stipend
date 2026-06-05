extends Node2D
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var progress_animation: AnimationPlayer = $ProgressAnimation
@onready var card_play: Node2D = $CardPlay
@onready var month: RichTextLabel = $month

#I want to make a system where in each 10 second there will be a random event, good or bad.
#The good events introduce risks, whereas the bad event introduce issues to solve with money or wit.
#
#SO the first system will have a random int generated and depending on the value it will give you a bad situation,
#though i will have to do extra math to prevent heavy repeats.
#
#

func random_situation() -> String:
	
	var situation := ""
	
	var chance = randf()
	#randomize()
	
	if chance < 0.5:
		situation = "Good"
	else:
		situation = "Bad"
		
	return situation


func _ready() -> void:
	card_play.hide()


func _process(delta: float) -> void:
	
	month.text = "Month " + str(Global.month)
	
	if progress_bar.value == 0 or progress_bar.value == 10:
		card_play.hide()
		var wait_time = randi_range(3, 9)
		await Global.wait(wait_time) # halfway
		
		progress_animation.pause()
		
		card_play.show()
		await card_play.card_place()
		await card_play.finish
		progress_animation.play()
	
		
