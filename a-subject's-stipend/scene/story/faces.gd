extends TextureRect
@export var a : int = 100
@export var b : int = 200
@export var c : int = 300
@export var d : int = 400
@export var e : int = 500

@onready var parent: TextureProgressBar = $".."

var _1 = preload("res://img/emotefaces/1.png")
var _2 = preload("res://img/emotefaces/2.png")
var _3 = preload("res://img/emotefaces/3 .png")
var _4 = preload("res://img/emotefaces/4.png")
var _5 = preload("res://img/emotefaces/5.png")

func _process(delta: float) -> void:
	
	var number = parent.value
	
	if number <= a:
		texture = _1
	elif number <= b:
		texture = _2
	elif number <= c:
		texture = _3
	elif number <= d:
		texture = _4
	elif number <= e:
		texture = _5
	
