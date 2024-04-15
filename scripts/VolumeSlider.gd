extends HSlider


func _on_drag_ended(value_changed):
	Global.volume = value / max_value
