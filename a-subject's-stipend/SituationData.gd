extends Node
#class_name SituationData

var payment := 0
var img := ""
var title := "Situation"
var body := "Description"

func servant(random: float):
	
	#random = 0.3
	
	if random <= 0.5: #bad
		
		var chance = randi_range(1, 5)
		chance = 1
		match chance:
			1:
				img = "res://img/situations/plate.png"
				payment = -100
				title = "Broken Dishes!"
				body = "Looks like an employee has dropped some plates! Her bills this month might be getting to her and hindering her work performance!"
				
				
		
	else: # good
		
		var chance = randi_range(1, 5)
		chance = 1
		match chance:
			1:
				payment = 100
				img = "res://img/situations/oldguy.png"
				title = "House Guest Complimented Service!"
				body = "A good friend complimented your houseworkers' service at a casual get-together! "
		
	
	if payment >= 0:
		return payment
	
	if payment < 0:
		return -1
	
