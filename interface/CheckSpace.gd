extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $CheckPointer.get_overlapping_areas().size() != 0:
		modulate = "#ff0000"
	else:
		modulate = "#ffffff"

func is_overalaping():
	return $CheckPointer.get_overlapping_areas().size() != 0
