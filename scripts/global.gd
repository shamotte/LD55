extends Node

enum RESOURCE { WOOD, ROCK, IRON, GOLD }
var resources = {
	RESOURCE.WOOD: {
		"name": "Wood", "sprite": preload("res://sprites/wood.png"), "type" : Priorities.ACTIONTYPES.GATHERWOOD
		,"time" : 2.0
	},
	RESOURCE.ROCK: {
		"name": "Rock", "sprite": preload("res://sprites/wood.png"), "type" : Priorities.ACTIONTYPES.GATHERROCK
		,"time" : 3.0	
	},
	RESOURCE.IRON: {
		"name": "Iron", "sprite": preload("res://sprites/wood.png"), "type" : Priorities.ACTIONTYPES.GATHERIRON,
		"time" : 7.0
	},
	RESOURCE.GOLD: {
		"name": "Gold", "sprite": preload("res://sprites/wood.png"), "type" : Priorities.ACTIONTYPES.GATHERGOLD
		,"time" : 10.0
	}
}
var current_resources = {}

enum ITEM { AXE }
var items = {
	ITEM.AXE: {
		"name": "Axe", "sprite": preload("res://sprites/axe.png"),
	}
}
var current_items = {}

enum BUILDINGS { TOWER, B1,B2,B3 }
var buildings = {
	BUILDINGS.TOWER: {
		"name": "Tower","sprite": preload("res://sprites/tower.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [50,75],
		"object": preload("res://object/tower.tscn")
	},
	BUILDINGS.B1: {
		"name": "Tower","sprite": preload("res://sprites/tower.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [50,75],
		"object": preload("res://object/tower.tscn")
	},
	BUILDINGS.B2: {
		"name": "Tower","sprite": preload("res://sprites/tower.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [50,75],
		"object": preload("res://object/tower.tscn")
	},
	BUILDINGS.B3: {
		"name": "Tower","sprite": preload("res://sprites/tower.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [50,75],
		"object": preload("res://object/tower.tscn")
	}
}

func _ready():
	
	for r in resources:
		current_resources[r] = 100
		
	for i in items:
		current_items[i] = 1

func _process(delta):
	pass
