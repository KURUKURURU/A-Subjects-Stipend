extends Node2D
@onready var animation: AnimationPlayer = $animation
@onready var darkcolor: ColorRect = $darkcolor
@onready var music = AudioServer.get_bus_index("Music")

func _ready() -> void:
	self.hide()

func fade(name:String):
	
	#if name == "in":
		#for i in range(10):
			#AudioServer.set_bus_volume_linear(music, 100.0)
			#await Global.wait(0.2)
			#AudioServer.set_bus_volume_linear(music, -10.0) # Lower volume by 10dBif name == "in":
	#if name == "out":
		##for i in range(10):
			##AudioServer.set_bus_volume_linear(music, 0.0)
			##await Global.wait(0.2)
			#AudioServer.set_bus_volume_linear(music, +10.0) # Lower volume by 10dB
	
	self.show()
	animation.play(name)
	await animation.animation_finished
	self.hide()
