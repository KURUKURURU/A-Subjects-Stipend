extends ScrollContainer
@onready var total_money: TextureProgressBar = $thing/Total_money
@onready var amount: RichTextLabel = $thing/Total_money/amount

@onready var emergency: TextureProgressBar = $thing/Emergency
@onready var emergency_label: RichTextLabel = $thing/Emergency/label
@onready var emergency_amount: RichTextLabel = $thing/Emergency/amount

#@onready var servants_salary_amount: RichTextLabel = $thing/Emergency/amount


func _ready() -> void:
	emergency.value = 0
	total_money.value = 3000


func _process(delta: float) -> void:
	emergency_amount.text = str(emergency.value)
	amount.text = str(total_money.value) + " gold left!"


func subtracting() -> void:
	emergency.value = emergency.value - 100
	total_money.value = total_money.value + 100
func adding() -> void:
	if total_money.value != 0:
		emergency.value = emergency.value + 100
		total_money.value = total_money.value - 100
