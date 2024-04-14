extends Node

var selected_building = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("left_mouse_button"):
		build_building(mousePosition())
	if Input.is_action_just_pressed("back") or Input.is_action_just_pressed("right_mouse_button"):
		selected_building = -1
	if selected_building != -1:
		$"../../CursorSprite".position = mousePosition()
		$"../../CursorSprite".texture = Global.buildings[selected_building]["sprite"]
	else:
		$"../../CursorSprite".global_position = mousePosition()
		$"../../CursorSprite".texture = null
		#$"../../CursorSprite".texture = preload("res://sprites/wood.png")

func build_building(position):
	if selected_building != -1:
		#paying for building
		for i in range(Global.buildings[selected_building]["resource_type"].size()):
			Global.current_resources[Global.buildings[selected_building]["resource_type"][i]] -= Global.buildings[selected_building]["resource_cost"][i]
		#Summoning Object
		var newBuilding = Global.buildings[selected_building]["object"].instantiate()
		newBuilding.position = position
		add_child(newBuilding)
		selected_building = -1
	
#set id for building
func set_building_id(id):
	selected_building = id
	
func mousePosition():
	return $"../..".mousePos()
	 
