extends Node2D

@export var resource_type: Global.RESOURCE
@export var resorce_count: int

@onready var id =  Priorities.get_id()

func action_finished():
	resource_type-=1;
	add_self_to_aveilible_actions()

	

func add_self_to_aveilible_actions():
	print("resource",id)
	Priorities.add_action(Global.resources[resource_type].type,id,get_node("."),Global.resources[resource_type].time)
	
func _ready():
	match resource_type:
		Global.RESOURCE.WOOD:
			$Sprite2D.texture = load("res://sprites/tree.png")
			
		Global.RESOURCE.ROCK:
			$Sprite2D.texture = load("res://sprites/rock.png")
		_:
			$Sprite2D.texture = null
	add_self_to_aveilible_actions()

