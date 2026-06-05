extends Node
class_name SituationData

var img := ""
var title := "Situation"
var body := "Description"

func servant(random: float):
	
	if random <= 0.5: #bad
		
		var chance = randi_range(1, 5)
		chance = 1
		match chance:
			1:
				img = "res://img/situations/plate.png"
				title = "Broken Dishes!"
				body = "Looks like an employee has dropped some plates! Her bills this month might be getting to her and hindering her work performance!"
				return "Broken Dishes!"
		
	else: # good
		
		var chance = randi_range(1, 5)
		chance = 1
		match chance:
			1:
				img = "res://img/situations/oldguy.png"
				title = "House Guest Complimented Service!"
				body = "A good friend complimented your houseworkers' service at a casual get-together! "
				return "House Guest Complimented Service!"
