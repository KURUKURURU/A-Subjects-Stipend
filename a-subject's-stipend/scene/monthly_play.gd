extends Node2D
@onready var progress_bar: ProgressBar = $ProgressBar
@onready var progress_animation: AnimationPlayer = $ProgressAnimation
@onready var card_play: Node2D = $CardPlay
@onready var month: RichTextLabel = $month

var ticks := 2



#I want to make a system where in each 10 second there will be a random event, good or bad.
#The good events introduce risks, whereas the bad event introduce issues to solve with money or wit.
#
#SO the first system will have a random int generated and depending on the value it will give you a bad situation,
#though i will have to do extra math to prevent heavy repeats.
#
#

#func random_situation() -> String:
	#
	#var situation := ""
	#
	#var chance = randf()
	##randomize()
	#
	#if chance < 0.5:
		#situation = "Good"
	#else:
		#situation = "Bad"
		#
	#return situation

#var added := 0

func _ready() -> void:
	ticks += Global.month
	Global.before = Global.owed
	card_play.hide()
	
	Questbox.startQuest("Debt")
	#await Questbox.drawTowards(Questbox.debt_progressbar, float((Global.current_principal)))
	Questbox.modify(Questbox.debt, Questbox.debt_progressbar, Global.owed)
	
	for i in range(ticks):
		await play()
	
	#Global.month += 1



func _process(delta: float) -> void:
	
	#Global.added = addedK
	
	if progress_bar.value >= 20:
		await finished_month()
	
	month.text = "Month " + str(Global.month)
	
	
func play():
	card_play.hide()
	var wait_time = randi_range(1, (12-Global.month))
	await Global.wait(wait_time) # halfway
	
	progress_animation.pause()
	
	card_play.show()
	await card_play.card_place()
	await card_play.finish
	
	progress_animation.play()
	ticks += 1
	
	return
		
func finished_month():
	Global.after = Global.owed
	await Fade.fade("in")
	Loader.change_level("res://scene/story/month_summary.tscn")
