extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var mouse_movement:bool = false
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index ==1 and event.is_pressed():
			mouse_movement = true
		elif event.button_index ==1 and not event.is_pressed():
			mouse_movement = false
	if event is InputEventMouseMotion and mouse_movement:
		position -= event.relative
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
