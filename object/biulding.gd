extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var id = Priorities.get_id()
@export var building_type : Global.BUILDINGS
var recipe : Global.RECIPES


func _ready():
	Priorities.add_action(Priorities.ACTIONTYPES.CRAFT,id,get_node("."),3.0)# Replace with function body.
	recipe =  Global.recipes[Global.buildings[building_type].recipe]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
