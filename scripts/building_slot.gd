extends Control

var building: Global.BUILDINGS

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	for i in range(Global.buildings[building]["resource_type"].size()):
		if Global.current_resources[ Global.buildings[building]["resource_type"][i] ] < Global.buildings[building]["resource_cost"][i]:
			return
	var manager = get_tree().get_first_node_in_group("BuildingManager")
	manager.set_building_id(building)
	var managerUI = get_tree().get_first_node_in_group("BuildingUI")
	managerUI.hide_panel(true)
