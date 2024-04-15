extends Control
var priority:int
var index:int


signal value_changed(index, new_priority)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func change_label(name : int):
	#$Label.text = name
	$Label.text = Global.resources[priority]["name"]
	$Icon.texture = Global.resources[priority]["sprite"]


func change_priority(n: int):
	priority = n
	$priority_elem.text = str(priority)
	
	
func _on_priority_elem_pressed():
	priority += 1
	if priority >=5:
		priority = 0
	$priority_elem.text = str(priority)
	value_changed.emit(index,priority)
	
