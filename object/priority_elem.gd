extends Button
class_name priority_box
var priority:int
var index:int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	priority += 1
	if priority >=5:
		priority = 0
		
func change_label(name : String):
	$Label.text = name
