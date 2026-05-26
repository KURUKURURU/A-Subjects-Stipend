extends Node2D
@onready var animation: AnimationPlayer = $animation
@onready var paper = $Paper
@onready var txt: RichTextLabel = $Paper/txt
@onready var img: TextureRect = $Paper/img
@onready var stretch: AudioStreamPlayer = $stretch
@onready var fade: TextureRect = $fade
@onready var fadetxt: RichTextLabel = $fade/RichTextLabel
@onready var fadeanimation: AnimationPlayer = $fade/RichTextLabel/AnimationPlayer
@onready var q_1: HBoxContainer = $fade/Q1
@onready var q_2: HBoxContainer = $fade/Q2
@onready var wrong: AudioStreamPlayer = $wrong
@onready var right: AudioStreamPlayer = $right

var card_img = preload("res://img/zxzx/vhjhb.png")
var pointgirl_img = preload("res://img/zxzx/v.png")
var holdgirl_img = preload("res://img/zxzx/Illustration4.png")

signal close
signal close_2

func _ready() -> void:
	await Fade.fade("out")
	
	await roll("How do we calculate credit card debt?", card_img)
	await roll("Credit debt is based on two core parts:
		PRINCIPAL and INTEREST", card_img)
	await roll("Principal is the amount of money you actually owe [wave]REDCARD[/wave], minus any payments already made.", holdgirl_img)
	await roll("Interest is the cost of borrowing money from [wave]REDCARD[/wave], an additional fee.", holdgirl_img)
	await roll("APR, or the Annual Percentage Rate, is the total yearly percentage gathered from your principal to calculate the cost of borrowing, based off your interest rate plus any additional services.", pointgirl_img)
	await roll("The APR gives a much clearer picture of the actual, total cost of a loan, however the interest rate and APR can be very similar when dealing with credit debt.", card_img)
	await roll("If you had a 22% APR, you would take 22% of your PRINCIPAL and that'd be what you'd need to pay as interest for the year.", pointgirl_img)
	await roll("Because you owe REDCARD [font_size=70] 4000 gold[/font_size], you will have 22% as interest for the year, 
	which would be 880 gold.", pointgirl_img)
	await roll("Though, credit cards usually calculate interest on a daily or monthly basis. Instead of waiting until the end of the year to charge you 880 gold, the bank would divide that 22% by 365 days to get a daily rate, or by 12 months to get a monthly rate.", pointgirl_img)
	
	await Global.wait(1.0)
	fade.show()
	animation.play("fade")
	await animation.animation_finished
	
	q_1.show()
	await _fade("APR is the amount needed to pay for annual interest.")
	q_1.hide()
	
	q_2.show()
	await _fade("Using what was previously established, if you aim to pay off your 4000 gold from REDCARD in 1 year with a 22% APR, how much interest would you need to pay?")
	q_2.hide()
	
	await Fade.fade("in")
	get_tree().change_scene_to_file("")
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("close")
	
func roll(words, imgs):
	
	txt.text = words
	img.texture = imgs
	paper.show()
	
	stretch.play()
	animation.play("roll_out")
	await animation.animation_finished
	
	await close
	animation.play("roll_in")
	await animation.animation_finished
	
	paper.hide()
	
func _fade(words):
	fadeanimation.play("type")
	await Global.wait(0.1)
	fadetxt.text = words
	
	await close_2
	fadetxt.text = ""
	


func correct() -> void:
	right.play()
	emit_signal("close_2")


func wrong_1() -> void:
	
	wrong.play()
	AlertMessage.Alert("An APR is the percentage of the principal, which is used to calculate your interest for a year if no payments were already made.")
	
func wrong_2() -> void:
	wrong.play()
	AlertMessage.Alert("To calculate the interest, you must find 22% of your owed amount: 4000(0.22) = 880 gold
		")
