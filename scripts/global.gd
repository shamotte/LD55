extends Node

var ITEM_OFFSET = 1000
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

enum ITEM { AXE = 1001, SWORD}
var items = {
	ITEM.AXE: {
		"name": "Axe", "sprite": preload("res://sprites/axe.png"),
	}
}
var current_items = {}


enum RECIPES {AXE}
var recipes = {
	RECIPES.AXE : {
		"work" : 5.0, "ingredients" : [[RESOURCE.WOOD,2], [RESOURCE.ROCK,2]],
		"results": [[ITEM.AXE,1]]
	}
	
	
}

enum BUILDINGS { TOWER, B1,B2,B3 }
var buildings = {
	BUILDINGS.TOWER: {
		"name": "Tower","sprite": preload("res://sprites/tower.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [50,75],
		"object": preload("res://object/tower.tscn"),
		"recipe" : RECIPES.AXE
	},
	BUILDINGS.B1: {
		"name": "Tower","sprite": preload("res://sprites/tower.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [50,75],
		"object": preload("res://object/tower.tscn"),
		"recipe" : null
	},
	BUILDINGS.B2: {
		"name": "Tower","sprite": preload("res://sprites/tower.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [50,75],
		"object": preload("res://object/tower.tscn"),
		"recipe" : null
	},
	BUILDINGS.B3: {
		"name": "Tower","sprite": preload("res://sprites/tower.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [50,75],
		"object": preload("res://object/tower.tscn"),
		"recipe" : null
	}
}

func _ready():
	for r in resources:
		current_resources[r] = 999
		
	for i in items:
		current_items[i] = 1

func _process(delta):
	pass
	
func add_resources(resource : RESOURCE, count : int):
	if current_items.has(resource):
		current_items[resource] += count
	else:
		current_items[resource] = count
	
func subtract_resources(resource : RESOURCE, count : int) -> bool:
	if current_items.has(resource):
		if current_items[resource] >=count:
			current_items[resource] -= count
			return true
		else:
			return false
	else:
		return false

func get_resource_count(resource : RESOURCE) -> int:
	if current_items.has(resource):
		return current_items[resource]
	else:
		return 0
