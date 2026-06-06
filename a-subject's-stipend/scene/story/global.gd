extends Node

var month := 1
var beginning := true

var current_principal := 4000
var extra := 0
var emergency := 0

var APR := 0.22


var month_interest: float:
	get:
		return int((current_principal * APR) / 12.0)


var owed: int:
	get:
		return int(current_principal + month_interest) # together is what should be paid


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
