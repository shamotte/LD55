extends Node2D

@export var resource_type: Global.RESOURCE

@onready var id =  Priorities.get_id()

func _ready():
	match resource_type:
		Global.RESOURCE.WOOD:
			$Sprite2D.texture = load("res://sprites/tree.png")
			Priorities.add_action(Priorities.ACTIONTYPES.GATHERWOOD,id,get_node("."))
		Global.RESOURCE.ROCK:
			$Sprite2D.texture = load("res://sprites/rock.png")
			Priorities.add_action(Priorities.ACTIONTYPES.GATHERROCK,id,get_node("."))
		_:
			$Sprite2D.texture = null

