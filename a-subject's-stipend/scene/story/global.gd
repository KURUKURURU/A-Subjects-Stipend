extends Node

var before := 0
var after := 0

var added : int
var leftover : int
var shown_paid : int 

var month := 1
var beginning := true

var current_principal := 4000
var paid := 0
var extra := 0
var emergency := 0
var antileft
var risk

var worst_areas
var best_areas

var APR := 0.22

var arrow_click = load("res://img/cendrillion.png")
var spark = load("res://img/spark.png")
var arrown = load("res://img/arrows.png")

func _ready():
	Input.set_custom_mouse_cursor(arrow_click, Input.CURSOR_ARROW, Vector2(16, 16))
	Input.set_custom_mouse_cursor(arrown, Input.CURSOR_HSIZE, Vector2(16, 16))
	Input.set_custom_mouse_cursor(spark, Input.CURSOR_POINTING_HAND, Vector2(16, 16))

var month_interest: float:
	get:
		return int((current_principal * APR) / 12.0)

var owed: int:
	get:
		return int(current_principal + month_interest) # together is what should be paid

var difference: int:
	get:
		return int(after - before) # together is what should be paid


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
