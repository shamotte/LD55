extends Control


# Called when the node enters the scene tree for the first time.
var camera :Camera2D
func _ready():
	camera = get_viewport().get_camera_2d()

@onready var pointer:Area2D = %MousePointer
var active_selection
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index ==1 and event.is_pressed():
			var intersections = pointer.get_overlapping_areas()
			pointer.global_position = $"../../..".mousePos()
			
			if not intersections.is_empty():
				var object = intersections[0].get_parent()
				print(object)
				
			
	

func unit_selection(object : unit):
	%UnitName = 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
