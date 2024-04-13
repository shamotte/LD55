extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var id = Priorities.get_id()

func _ready():
	print("budynek", id)
	Priorities.add_action(Priorities.ACTIONTYPES.CRAFT,id,get_node("."),3.0)# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
