extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_check_button_toggled(toggled_on):
	$Panel.visible = toggled_on


