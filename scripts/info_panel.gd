extends Control

var PRIORITIESLENGTH = 7
@onready var priority_box= preload("res://object/priority_elem.tscn")
# Called when the node enters the scene tree for the first time.
var camera :Camera2D
func update_priority(index:int,new_value : int):
	
	if active_selection is unit:
		active_selection.priorities[index] = new_value
		print("writing new priority")
func _ready():
	camera = get_viewport().get_camera_2d()
	%PriorityBoxes.visible= false
	for p in range(PRIORITIESLENGTH):
		var child = priority_box.instantiate() 
		child.priority = 0
		child.index = p
		child.value_changed.connect(update_priority)
		#child.change_label(Priorities.get_action_name(p))
		child.change_label(p)
		%PriorityBoxes.add_child(child)
		
	
	

@onready var pointer:Area2D = %MousePointer
var active_selection
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index ==1 and event.is_pressed():
			
			var intersections = pointer.get_overlapping_areas()
			
			if not intersections.is_empty():
				var object = intersections[0].get_parent()
				object.display_previev($".")
				
			
	

func unit_selection(object : unit):
	%UnitName.text = Global.units[object.type].name
	%preview_icon.texture = object.get_node("Sprite").texture
	%PriorityBoxes.visible = true
	active_selection = object
	
	for p in range(len(object.priorities)):
		%PriorityBoxes.get_child(p).change_priority(object.priorities[p])
		
	
func resource_selection(object : Res):
	%PriorityBoxes.visible = false
	%UnitName.text = Global.resources[object.resource_type].name
	%preview_icon.texture = object.get_node("Sprite2D").texture
	
func building_selection(object : buildingObject):
	%PriorityBoxes.visible = false
	%preview_icon.texture = object.get_node("Sprite2D").texture
	%UnitName.text = Global.buildings[object.building_type].name

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pointer.global_position = $"../../..".mousePos()
