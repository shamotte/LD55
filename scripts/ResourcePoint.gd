extends Node2D

@export var resource_type: Global.RESOURCE

func _ready():
	match resource_type:
		Global.RESOURCE.WOOD:
			$Sprite2D.texture = load("res://sprites/tree.png")
		Global.RESOURCE.ROCK:
			$Sprite2D.texture = load("res://sprites/rock.png")
		_:
			$Sprite2D.texture = null
