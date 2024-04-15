extends Node2D
class_name Res

@export var resource_type: Global.RESOURCE
@export var resource_count: int = 3

@onready var id =  Priorities.get_id()

func action_finished():
	resource_count-=1;
	if resource_count == 0:
		Global.add_resources(resource_type, 1)
		queue_free()
	await get_tree().create_timer(10.0).timeout
	add_self_to_available_actions()

	

func add_self_to_available_actions():
	
	Priorities.add_action(Global.resources[resource_type].type,id,get_node("."),Global.resources[resource_type].time)
	
func _ready():
	$Sprite2D.texture = Global.resources[resource_type]["resource_point_texture"]
	add_self_to_available_actions()
	
	$AnimationPlayer.play("spawn")
	
	
func display_previev(node : Control):
		node.resource_selection(self)

