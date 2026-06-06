extends HBoxContainer
@onready var m: RichTextLabel = $m
@onready var p: RichTextLabel = $p
@onready var i: RichTextLabel = $i
@onready var total: RichTextLabel = $total

func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	
	var percentage =  str(int((Global.owed)/4074 * 100)) + "%"
	
	m.text = name.replace("Month_", "") 
	
	var month = int(m.text) 
	
	#p.text = str(GameSummary.month_principal[month]) + " paid"
	#i.text = str(GameSummary.month_interest[month]) + " paid"
	total.text = percentage + " paid"
