extends Node

const map_width = 1920
const map_height = 1080

var ITEM_OFFSET = 1000
enum RESOURCE { WOOD, ROCK, IRON, GOLD }
var resources = {
	RESOURCE.WOOD: {
		"name": "Wood", "sprite": preload("res://sprites/Resources/wood.png"), "type" : Priorities.ACTIONTYPES.GATHERWOOD
		,"time" : 2.0
	},
	RESOURCE.ROCK: {
		"name": "Rock", "sprite": preload("res://sprites/Resources/green_gem.png"), "type" : Priorities.ACTIONTYPES.GATHERROCK
		,"time" : 3.0	
	},
	RESOURCE.IRON: {
		"name": "Iron", "sprite": preload("res://sprites/Resources/Copium1.png"), "type" : Priorities.ACTIONTYPES.GATHERIRON,
		"time" : 7.0
	},
	RESOURCE.GOLD: {
		"name": "Gold", "sprite": preload("res://sprites/Resources/Amongium.png"), "type" : Priorities.ACTIONTYPES.GATHERGOLD
		,"time" : 10.0
	}
}



var current_resources = {}

enum ITEM { AXE = 1001, SWORD}
var items = {
	ITEM.AXE: {
		"name": "Axe", "sprite": preload("res://sprites/Items/axe.png"),
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

enum BUILDINGS { PORTAL,TOWER,LAVALAKE,B3 }
var buildings = {
	BUILDINGS.PORTAL: {
		"name": "Tower","sprite": preload("res://sprites/Buildings/DonutPortal.png"),
		"resource_type": [RESOURCE.ROCK], "resource_cost": [2],
		"object": preload("res://object/tower.tscn"),
		"recipe" : RECIPES.AXE
	},
	BUILDINGS.TOWER: {
		"name": "Tower","sprite": preload("res://sprites/Buildings/tower.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [5,7],
		"object": preload("res://object/tower.tscn"),
		"recipe" : null
	},
	BUILDINGS.LAVALAKE: {
		"name": "Lava Lake","sprite": preload("res://sprites/Buildings/LavaLake.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [1,7],
		"object": preload("res://object/tower.tscn"),
		"recipe" : null
	},
	BUILDINGS.B3: {
		"name": "Tower","sprite": preload("res://sprites/Buildings/tower.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [50,70],
		"object": preload("res://object/tower.tscn"),
		"recipe" : null
	}
}

enum UNIT {CULTIST,IMP,CEMON,PYTHONOS,LORD}
var units = {
	UNIT.CULTIST: {
		"name" : "Cultist", "sprite": preload("res://sprites/Units/Cultist.png"),
		"toolSprite" : preload("res://sprites/Items/Eye_Staff.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [1,1],
		"object": preload("res://object/unit.tscn"),
		"HP" : 10, "DMG" : 2
	},
	UNIT.IMP: {
		"name" : "Imp", "sprite": preload("res://sprites/Units/imp.png"),
		"toolSprite" : preload("res://sprites/Items/axe.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [1,1],
		"object": preload("res://object/unit.tscn"),
		"HP" : 10, "DMG" : 2
	},
	UNIT.CEMON: {
		"name" : "Cemon", "sprite": preload("res://sprites/Units/Cemon.png"),
		"toolSprite" : null,
		"resource_type": [RESOURCE.WOOD,RESOURCE.IRON], "resource_cost": [1,1],
		"object": preload("res://object/unit.tscn"),
		"HP" : 10, "DMG" : 2
	},
	UNIT.PYTHONOS: {
		"name" : "Pythonos", "sprite": preload("res://sprites/Units/Pythonomium.png"),
		"toolSprite" : null,
		"resource_type": [RESOURCE.WOOD,RESOURCE.GOLD], "resource_cost": [1,1],
		"object": preload("res://object/unit.tscn"),
		"HP" : 10, "DMG" : 2
	},
	UNIT.LORD: {
		"name" : "Demon Lord", "sprite": preload("res://sprites/Units/DemonLord.png"),
		"toolSprite" : null,
		"resource_type": [RESOURCE.IRON,RESOURCE.GOLD], "resource_cost": [1,1],
		"object": preload("res://object/unit.tscn"),
		"HP" : 10, "DMG" : 2
	},
}

enum ENEMY {SLIME,WENDIGO,PEASANT,PRIEST,KNIGHT,HORSEMAN}
var enemies = {
	ENEMY.SLIME: {
		"name" : "Chłop", "sprite": preload("res://sprites/Units/Peasant.png"),
		"object": preload("res://object/unit.tscn"),
		"HP" : 5, "DMG" : 1
	},
	ENEMY.WENDIGO: {
		"name" : "Kapłan", "sprite": preload("res://sprites/Units/Priest.png"),
		"object": preload("res://object/unit.tscn"),
		"HP" : 5, "DMG" : 1
	},
	ENEMY.PEASANT: {
		"name" : "Chłop", "sprite": preload("res://sprites/Units/Peasant.png"),
		"object": preload("res://object/unit.tscn"),
		"HP" : 5, "DMG" : 1
	},
	ENEMY.PRIEST: {
		"name" : "Kapłan", "sprite": preload("res://sprites/Units/Priest.png"),
		"object": preload("res://object/unit.tscn"),
		"HP" : 5, "DMG" : 1
	},
	ENEMY.KNIGHT: {
		"name" : "Chłop", "sprite": preload("res://sprites/Units/knight.png"),
		"object": preload("res://object/unit.tscn"),
		"HP" : 5, "DMG" : 1
	},
	ENEMY.HORSEMAN: {
		"name" : "Chłop", "sprite": preload("res://sprites/Units/Horseman.png"),
		"object": preload("res://object/unit.tscn"),
		"HP" : 5, "DMG" : 1
	},
	
}


func _ready():
	for r in resources:
		current_resources[r] = 10
		
	for i in items:
		current_items[i] = 1

func _process(delta):
	pass
	
func add_resources(resource : RESOURCE, count : int):
	if current_resources.has(resource):
		current_resources[resource] += count
	else:
		current_resources[resource] = count
	
func subtract_resources(resource : RESOURCE, count : int) -> bool:
	if current_resources.has(resource):
		if current_resources[resource] >=count:
			current_resources[resource] -= count
			return true
		else:
			return false
	else:
		return false

func get_resource_count(resource : RESOURCE) -> int:
	if current_resources.has(resource):
		return current_resources[resource]
	else:
		return 0
