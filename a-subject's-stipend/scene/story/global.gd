extends Node

var owed : int

var month := 1
var beginning := true

var current_principal := 4000
var month_interest := 0
var extra := 0
var emergency := 0

var APR := 0.22


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _process(delta: float) -> void:
	
	month_interest = (current_principal * APR)/12
	owed = current_principal + month_interest
