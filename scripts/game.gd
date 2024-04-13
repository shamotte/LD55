extends Node2D

var resource_slot = preload("res://interface/resource_slot.tscn")
var item_slot = preload("res://interface/item_slot.tscn")
var building_slot = preload("res://interface/building_slot.tscn")
var building_cost = preload("res://interface/building_cost.tscn")

var resource_info
#Buildings Objects


# Called when the node enters the scene tree for the first time.
func _ready():
	for r in Global.current_resources:
		var s = resource_slot.instantiate()
		s.get_node("Sprite").texture = Global.resources[r]["sprite"]
		s.get_node("Count").text = str(Global.current_resources[r])
		s.get_node("Name").text = Global.resources[r]["name"]
		$UI/UI/Resources.add_child(s)
	resource_info = $UI/UI/Resources.get_children() 
		
	for i in Global.current_items:
		var s = item_slot.instantiate()
		s.get_node("Sprite").texture = Global.items[i]["sprite"]
		s.get_node("Count").text = str(Global.current_items[i])
		$UI/UI/Items.add_child(s)
		
	for i in Global.buildings:
		var s = building_slot.instantiate()
		s.get_node("Building").texture = Global.buildings[i]["sprite"]
		s.building = i
		for j in range(Global.buildings[i]["resource_type"].size()):
			var c = building_cost.instantiate()
			c.get_node("Sprite").texture = Global.resources[Global.buildings[i]["resource_type"][j]]["sprite"]
			c.get_node("Count").text = str(Global.buildings[i]["resource_cost"][j])
			s.get_node("Cost").add_child(c)
		$UI/UI/Building/Panel/ScrollContainer/GridContainer.add_child(s)
		
		
var active_selection
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index ==1 and event.is_pressed():
			pass
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for i in range(Global.current_resources.size()):
		resource_info[i].get_node("Count").text = str(Global.current_resources[i])
	#for r in Global.current_resources:
	#	var s = resource_slot.instantiate()
	#	s.get_node("Sprite").texture = Global.resources[r]["sprite"]
	#	s.get_node("Count").text = str(Global.current_resources[r])
	#	s.get_node("Name").text = Global.resources[r]["name"]
	#	$UI/UI/Resources.add_child(s)
	#set_building_id(0)


var resource_point = preload("res://object/resource_point.tscn")

func _on_resource_spawn_timer_timeout():
	if get_tree().get_nodes_in_group("resource_point").size() < 10:
		for i in range(3):
			var rp = resource_point.instantiate()
			rp.global_position = Vector2(randi_range(0, 640), randi_range(0,360))
			rp.resource_type = Global.resources.keys().pick_random()
			$GameSpace.add_child(rp)
