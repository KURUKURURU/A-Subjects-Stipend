extends Node2D
@onready var color_rect: ColorRect = $ColorRect
@onready var screen: Node2D = $Screen
@onready var blur: ColorRect = $Screen/Blur
@onready var profit: Node2D = $Screen/Profit
@onready var debt: Node2D = $Screen/Debt
@onready var transition_button: TextureButton = $Screen/TransitionButton
@onready var animation: AnimationPlayer = $Screen/TransitionButton/animation
@onready var bank: TextureProgressBar = $Screen/Debt/Bank
@onready var scroll_container: ScrollContainer = $Screen1/Profit/ScrollContainer

@onready var transition: TextureButton = $Transition
@onready var transition_animation: AnimationPlayer = $Transition/animation

var page := 1

func _ready() -> void:
	bank.value = 1025
	
	await Fade.fade("out")
	
	AlertMessage.Alert("You must budget your finances efficiently and prepare well.")
	await AlertMessage.accept_message
	

func _process(delta: float) -> void:
	pass

func Transition() -> void:
	if !transition_animation.is_playing():
		if page == 1:
			transition_animation.play("Page2")
			page = 2
		elif page == 2:
			transition_animation.play("Page1")
			page = 1
