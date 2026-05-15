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

var page := "Profits"

func _ready() -> void:
	bank.value = 1025
	
	await Fade.fade("out")
	
	AlertMessage.Alert("You must budget your finances efficiently and prepare well.")
	await AlertMessage.accept_message
	

func _process(delta: float) -> void:
	pass
