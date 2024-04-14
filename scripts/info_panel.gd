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
			
			if not intersections.is_empty():
				var object = intersections[0].get_parent()
				object.display_previev($".")
				
			
	
@onready var priority_box= preload("res://object/priority_elem.tscn")
func unit_selection(object : unit):
	%UnitName.text = Global.units[object.type].name
	%preview_icon.texture = object.get_node("Sprite").texture
	
	for p in range(len(object.priorities)):
		%PriorityBoxes.get_child(p).priority = object.priorities[p]
		
	
func resource_selection(object : Res):
	%UnitName.text = Global.resources[object.resource_type].name
	%preview_icon.texture = object.get_node("Sprite2D").texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pointer.global_position = $"../../..".mousePos()
