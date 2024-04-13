extends Node

enum RESOURCE { WOOD, ROCK, IRON, GOLD }
var resources = {
	RESOURCE.WOOD: {
		"name": "Wood", "sprite": preload("res://sprites/wood.png")
	},
	RESOURCE.ROCK: {
		"name": "Rock", "sprite": preload("res://sprites/wood.png")
	},
	RESOURCE.IRON: {
		"name": "Iron", "sprite": preload("res://sprites/wood.png")
	},
	RESOURCE.GOLD: {
		"name": "Gold", "sprite": preload("res://sprites/wood.png")
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


func _ready():
	
	for r in resources:
		current_resources[r] = 0
		
	for i in items:
		current_items[i] = 1

func _process(delta):
	pass
