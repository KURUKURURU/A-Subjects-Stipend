extends ScrollContainer
@onready var total_money: TextureProgressBar = $thing/Total_money
@onready var amount: RichTextLabel = $thing/Total_money/amount

@onready var emergency: TextureProgressBar = $thing/Emergency
@onready var emergency_label: RichTextLabel = $thing/Emergency/label
@onready var emergency_amount: RichTextLabel = $thing/Emergency/amount
@onready var bad: AudioStreamPlayer = $bad

@onready var coin: AudioStreamPlayer = $coin
#@onready var _ScrollContainer: AudioStreamPlayer = $"../.."

#@onready var servants_salary_amount: RichTextLabel = $thing/Emergency/amount


func _ready() -> void:
	total_money.value = 3000


func _process(delta: float) -> void:
	amount.text = str(total_money.value) + " gold left!"


func subtracting(path) -> void:
	coin.play()
	
	var frank = path
	
	frank.value = frank.value - 100
	total_money.value = total_money.value + 100
	
func adding(path) -> void:
	if total_money.value == 0:
		bad.play()
		return

	coin.play()
	
	var frank = path
	
	if total_money.value != 0:
		frank.value = frank.value + 100
		total_money.value = total_money.value - 100
