extends Control
@onready var img: TextureRect = $img
@onready var sfx: AudioStreamPlayer2D = $sfx
@onready var sfx2: AudioStreamPlayer2D = $sfx2
@onready var animation: AnimationPlayer = $animation

@onready var debt: Node2D = $Debt
@onready var debt_progressbar: TextureProgressBar = $Debt/progressbar

@onready var likability: Node2D = $Likability
@onready var like_progressbar: TextureProgressBar = $Likability/progressbar

var debt_progress 
var like_progress

func _ready() -> void:
	debt_progressbar.value = 100
	debt.hide()
	likability.hide()
	
	#test system vvvv
	#await modify(debt, debt_progressbar, 50)
	#await modify(debt, debt_progressbar, 20)
	#await modify(likability, like_progressbar, 20)
	
func startQuest(title: String):
	
	match title:
		"Debt":
			debt.show()
			likability.hide()
		"Like":
			debt.hide()
			likability.show()
	
	sfx.play()
	
	animation.play("down")
	await animation.animation_finished
	await wait(2.0)
	animation.play("up")
	await animation.animation_finished
	
	debt.hide()
	likability.hide()
	
func drawTowards(bar: TextureProgressBar, target: float):
	var old := bar.value
	var steps := 20
	var step_time := 0.03
	
	bar.value = old

	for i in range(steps):
		await wait(step_time)

		var t = float(i + 1) / float(steps) # have no idea what this does but it works...
		bar.value = old + (target - old) * t
		sfx2.play()
		

func modify(node: Node2D, bar: TextureProgressBar, target: float):
	
	node.show()
	
	animation.play("down")
	await animation.animation_finished
	
	await drawTowards(bar, target)
	await wait(2.0)
	
	animation.play("up")
	await animation.animation_finished
	

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
	
	
	
	
	
	
	
	
	
