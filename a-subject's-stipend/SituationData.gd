extends Node
#class_name SituationData

var payment := 0
var img := ""
var title := "Situation"
var body := "Description"
var area

#var sorted = Global.risk
#
#var worst_3 = [
	#sorted[0].name,
	#sorted[1].name,
	#sorted[2].name
#]
#
#var best_3 = [
	#sorted[-1].name,
	#sorted[-2].name,
	#sorted[-3].name
#]

#func situation( random: float):
	#
	##make an array and pick a random object from array, then that object would be the area that i want to have a issue
	#
	##random = 0.3
	#
	#if random <= 0.5: #bad
		#
		#var chance = randi_range(1, 5)
		##chance = 1
		#match chance:
			#1:
				#img = "res://img/situations/plate.png"
				#payment = -100
				#title = "Broken Dishes!"
				#body = "Looks like an employee has dropped some plates! Her bills this month might be getting to her and hindering her work performance!"
			#
				#
		#
	#else: # good
		#
		#var chance = randi_range(1, 5)
		##chance = 1
		#match chance:
			#1:
				#payment = 100
				#img = "res://img/situations/oldguy.png"
				#title = "House Guest Complimented Service!"
				#body = "A good friend complimented your houseworkers' service at a casual get-together! "
		#
	#
	#return payment
	
func situation(random):
	if randf() < 0.5:
		area = Global.worst_areas.pick_random()
		# generate bad event
	else:
		area = Global.best_areas.pick_random()
		# generate good event
		

	if random <= 0.5: #bad

		var chance = randi_range(1, 3)
		#chance = 1

		match area:
			"food":
				img = "res://img/situations/oldguy.png"
				payment = -200
				title = "Insults to the Chef!"
				body = "You served your guest horrid food!"
			"water":
				img = "res://img/situations/glass.png"
				payment = -100
				title = "Water, Contaminated!"
				body = "This water should be sealed and contained somewhere sealed and impenetrable."
			"servants":
				img = "res://img/situations/plate.png"
				payment = -200
				title = "Broken Dishes!"
				body = "Looks like an employee has dropped some plates! Her bills this month might be getting to her and hindering her work performance!"
			"horsecare":
				#add another instance here
				img = "res://img/situations/horse.png"
				payment = -500
				title = "Decommissioned Horse!"
				body = "You need to pay for your sick horse's care!"
	else: # good

		var chance = randi_range(1, 5)
		#chance = 1

		match area:
			"servants":
				payment = 100
				img = "res://img/situations/maid.png"
				title = "Tea Party Compliments your Service!"
				body = "Friends complimented your houseworkers' service at a casual tea party get-together! "
			"water":
				img = "res://img/situations/merchant.png"
				payment = 200
				title = "Merchant visits!"
				body = "Your uncle, an expert in merchant-ology, visits from a faraway land!"
			"food":
				img = "res://img/situations/oldguy.png"
				payment = 200
				title = "House Guest Complimented Service!"
				body = "Looks like an employee has dropped some plates! Her bills this month might be getting to her and hindering her work performance!"
			"horsecare":
				img = "res://img/situations/paper.png"
				payment = 100
				title = "No More Horsing Around!"
				body = "A letter has come to your home, praising your horse's beauty when it rode through town a while back!"

	return payment
