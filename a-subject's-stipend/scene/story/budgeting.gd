extends Node2D
@onready var color_rect: ColorRect = $ColorRect
@onready var screen: Node2D = $Screen
@onready var debt: Node2D = $Screen/Debt
@onready var bank: TextureProgressBar = $Screen/Debt/Bank
@onready var scroll_container: ScrollContainer = $Screen1/Profit/ScrollContainer

@onready var transition: TextureButton = $Transition
@onready var transition_animation: AnimationPlayer = $Transition/animation

@onready var principal: Control = $Screen/Debt/VBoxContainer/Principal
@onready var principal_title: RichTextLabel = $Screen/Debt/VBoxContainer/Principal/title
@onready var principal_num: RichTextLabel = $Screen/Debt/VBoxContainer/Principal/num
@onready var interest: Control = $Screen/Debt/VBoxContainer/Interest
@onready var interest_title: RichTextLabel = $Screen/Debt/VBoxContainer/Interest/title
@onready var interest_num: RichTextLabel = $Screen/Debt/VBoxContainer/Interest/num
@onready var total: Control = $Screen/Debt/VBoxContainer/Total
@onready var total_title: RichTextLabel = $Screen/Debt/VBoxContainer/Total/title
@onready var total_num: RichTextLabel = $Screen/Debt/VBoxContainer/Total/num
@onready var extra_num: RichTextLabel = $Screen/Debt/VBoxContainer/extra/num
@onready var DEBT_PAYMENT: TextureProgressBar = $Screen1/Profit/DebtPayment2
@onready var animation: AnimationPlayer = $animation
@onready var total_money: TextureProgressBar = $Screen1/Profit/ScrollContainer/thing/Total_money

@onready var _continue: Button = $Screen/Debt/VBoxContainer/Control/Continue
@onready var emergency: TextureProgressBar = $Screen1/Profit/ScrollContainer/thing/Emergency
@onready var food: TextureProgressBar = $Screen1/Profit/ScrollContainer/thing/SSalary2
@onready var water: TextureProgressBar = $Screen1/Profit/ScrollContainer/thing/SSalary3
@onready var servants: TextureProgressBar = $Screen1/Profit/ScrollContainer/thing/SSalary
@onready var horsecare: TextureProgressBar = $Screen1/Profit/ScrollContainer/thing/SSalary4

#var GS = GameSummary.new()

var page := 1


func _ready() -> void:
	#bank.value = 1025
	
	await Fade.fade("out")
	
	if Global.beginning:
		Global.beginning = false
		
		#AlertMessage.Alert("")
		await PopUp.popup("Budget", "A budget is a customized plan that tracks your income and guides how you spend your money over a specific period, usually a month. It helps you prioritize your expenses, avoid unnecessary debt, and build savings for future goals.")
		await PopUp.popup("How do I manage my budget?", "You can adjust the several faucets your money goes to, and put what's left into savings. Make sure you're factoring your debt payment though, as that's one of your larger priorities!")
		await PopUp.popup("", "Use the - and + buttons to add and subtract from the smaller allocated budgets, and drag your mouse to the side to change screens.")
	
	#AlertMessage.Alert("You must budget your finances efficiently and prepare well.")
	#await AlertMessage.accept_message
	

func _process(delta: float) -> void:
	
	principal_num.text = str(Global.current_principal)
	interest_num.text = "+" + str(Global.month_interest)
	extra_num.text = "+" + str(Global.extra)
	total_num.text = "[wave]" + str(Global.owed)
	
	if total_money.value == 0:
		_continue.disabled = false
		_continue.text = "Progress through the Month?"
	else: 
		_continue.disabled = true
		_continue.text = "You must allocate all your money."

func Transition() -> void:
	if !transition_animation.is_playing():
		if page == 1:
			transition_animation.play("Page2")
			page = 2
		elif page == 2:
			transition_animation.play("Page1")
			page = 1



func debts_q() -> void:
	print("ggg")
	PopUp.popup("Debt", "An obligation or liability to pay or render something to someone else. ")

func spending_q() -> void:
	print("spending question")
	PopUp.popup("Spending Effectively", "You can organize your spending by figuring out what's is more expensives the best price for all your purchase categories. ")

func FINISH() -> void: # next month
	var sorted = get_sorted_areas()

	Global.worst_areas = [
	sorted[0]["name"],
	sorted[1]["name"],
	sorted[2]["name"]
	]

	Global.best_areas = [
		sorted[-1]["name"],
		sorted[-2]["name"],
		sorted[-3]["name"]
	]
	#Global.shown_paid = Global.current_principal
	Global.paid = DEBT_PAYMENT.value 
	Global.emergency += emergency.value 
	
	GameSummary.month_principal[Global.month] = Global.current_principal
	GameSummary.month_interest[Global.month] = Global.month_interest
	GameSummary.month_paid[Global.month] = Global.paid
	
	Global.current_principal = Global.owed - DEBT_PAYMENT.value 
	Global.extra = 0
	
	Global.shown_paid = Global.current_principal
	Global.risk = get_sorted_areas()
	
	if Global.current_principal <= 0 or Global.month >= 6:
		Global.antileft = 4074 - Global.owed 
		Loader.change_level("res://scene/story/game_summary.tscn")
	else:
		
		await Fade.fade("in")
		Loader.change_level("res://scene/monthly_play.tscn")

#func get_random_risk_area():
	#var total = 0
#
	#for area in budgets:
		#total += max(1, 500 - budgets[area])
#
	#var roll = randi_range(1, total)
#
	#for area in budgets:
		#roll -= max(1, 500 - budgets[area])
#
		#if roll <= 0:
			#return area
#
	#return "debt"

func get_sorted_areas():
	var arr = [
		{"name":"servants", "value":servants.value},
		{"name":"food", "value":food.value},
		{"name":"water", "value":water.value},
		{"name":"horsecare", "value":horsecare.value}
	]

	arr.sort_custom(func(a,b):
		return a.value < b.value
	)

	return arr
