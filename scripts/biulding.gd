extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var id = Priorities.get_id()
@export var building_type : Global.BUILDINGS
var recipe : Global.RECIPES


func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
