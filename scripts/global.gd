extends Node

const map_width = 1920
const map_height = 1080

var ITEM_OFFSET = 1000
enum RESOURCE { WOOD, ROCK, IRON, GOLD }
var resources = {
	RESOURCE.WOOD: {
		"name": "Wood", "sprite": preload("res://sprites/Resources/wood.png"), "type" : Priorities.ACTIONTYPES.GATHERWOOD
		,"time" : 2.0, "resource_point_texture": preload("res://sprites/Resources/tree.png")
	},
	RESOURCE.ROCK: {
		"name": "Rock", "sprite": preload("res://sprites/Resources/green_gem.png"), "type" : Priorities.ACTIONTYPES.GATHERROCK
		,"time" : 3.0, "resource_point_texture": preload("res://sprites/Resources/rock.png")	
	},
	RESOURCE.IRON: {
		"name": "Iron", "sprite": preload("res://sprites/Resources/Copium1.png"), "type" : Priorities.ACTIONTYPES.GATHERIRON,
		"time" : 7.0, "resource_point_texture": preload("res://sprites/Resources/Iron.png")
	},
	RESOURCE.GOLD: {
		"name": "Gold", "sprite": preload("res://sprites/Resources/Amongium.png"), "type" : Priorities.ACTIONTYPES.GATHERGOLD
		,"time" : 10.0, "resource_point_texture": preload("res://sprites/Resources/gold.png")
	}
}



var current_resources = {}




enum RECIPES {R1,R2,R3,R4}
var recipes = {
	RECIPES.R1 : {
		"work" : 5.0, "ingredients" : [[RESOURCE.WOOD,2], [RESOURCE.ROCK,2]],
		"results": [[RESOURCE.ROCK,1]]
	},
	
	RECIPES.R2 : {
		"work" : 5.0, "ingredients" : [[RESOURCE.WOOD,2], [RESOURCE.ROCK,2]],
		"results": [[RESOURCE.ROCK,1]]
	},
	RECIPES.R3 : {
		"work" : 5.0, "ingredients" : [[RESOURCE.WOOD,2], [RESOURCE.ROCK,2]],
		"results": [[RESOURCE.ROCK,1]]
	},
	RECIPES.R4 : {
		"work" : 5.0, "ingredients" : [[RESOURCE.WOOD,2], [RESOURCE.ROCK,2]],
		"results": [[RESOURCE.ROCK,1]]
	}
	
	
}

enum BUILDINGS { PORTAL,TOWER,LAVALAKE,FORGE,TENTACLE,TENTACLESFIELD }
var buildings = {
	BUILDINGS.PORTAL: {
		"name": "Tower","sprite": preload("res://sprites/Buildings/DonutPortal.png"),
		"resource_type": [RESOURCE.ROCK], "resource_cost": [2],
		"object": preload("res://object/tower.tscn"),
		"recipe" : RECIPES.R1
	},
	BUILDINGS.TOWER: {
		"name": "Tower","sprite": preload("res://sprites/Buildings/tower.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [5,7],
		"object": preload("res://object/tower.tscn"),
		"recipe" :RECIPES.R2
	},
	BUILDINGS.LAVALAKE: {
		"name": "Lava Lake","sprite": preload("res://sprites/Buildings/LavaLake.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [1,1],
		"object": preload("res://object/tower.tscn"),
		"recipe" : RECIPES.R3
		
		
	},
	BUILDINGS.FORGE: {
		"name": "Forge","sprite": preload("res://sprites/Buildings/Forge.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [1,1],
		"object": preload("res://object/tower.tscn"),
		"recipe" : RECIPES.R4
	},
	BUILDINGS.TENTACLE: {
		"name": "Lava Lake","sprite": preload("res://sprites/Buildings/Tentacle.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [1,1],
		"object": preload("res://object/tower.tscn"),
		"recipe" : null
	},
	BUILDINGS.TENTACLESFIELD: {
		"name": "Lava Lake","sprite": preload("res://sprites/Buildings/Tentacles.png"),
		"resource_type": [RESOURCE.WOOD,RESOURCE.ROCK], "resource_cost": [1,1],
		"object": preload("res://object/tower.tscn"),
		"recipe" : null
	},
}

enum UNIT {CULTIST,IMP,CEMON,PYTHONUS,LORD}
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
	UNIT.PYTHONUS: {
		"name" : "Pythonus", "sprite": preload("res://sprites/Units/Pythonomium.png"),
		"toolSprite" : null,
		"resource_type": [RESOURCE.WOOD,RESOURCE.GOLD], "resource_cost": [1,1],
		"object": preload("res://object/unit.tscn"),
		"HP" : 10, "DMG" : 2
	},
	UNIT.LORD: {
		"name" : "Demon Lord", "sprite": preload("res://sprites/Units/DemonLord.png"),
		"toolSprite" : preload("res://sprites/Items/demon_sword.png"),
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

enum PRIORIRITY {WOOD,ROCK,IRON,FOOD,GOLD,CRAFT,FIGHT}
var priorieties = {
	PRIORIRITY.WOOD: {
		"name" : "Wood", "sprite": preload("res://sprites/Resources/wood.png")
		},
	PRIORIRITY.ROCK: {
		"name" : "Rock", "sprite": preload("res://sprites/Resources/green_gem.png")
		},
	PRIORIRITY.IRON: {
		"name" : "Iron", "sprite": preload("res://sprites/Resources/Copium1.png")
		},
	PRIORIRITY.FOOD: {
		"name" : "Food", "sprite": preload("res://sprites/Resources/Amongium.png")
		},
	PRIORIRITY.GOLD: {
		"name" : "Gold", "sprite": preload("res://sprites/Resources/obsidianium.png")
		},
	PRIORIRITY.CRAFT: {
		"name" : "Craft", "sprite": preload("res://sprites/UI/axe32.png")
		},
	PRIORIRITY.FIGHT: {
		"name" : "Fight", "sprite": preload("res://sprites/UI/axe32.png")
		},
	}

func _ready():
	for r in resources:
		current_resources[r] = 10

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
