extends Node2D

@export var  max_hp:float =100
@onready var hp:float = max_hp

signal died
@onready var id = Priorities.get_id()
# Called when the node enters the scene tree for the first time.
func _ready():
	Priorities.add_action(Priorities.ACTIONTYPES.FIGHT,id,$".",0.0)# Replace with function body.

func take_damage(damage:float):
	hp-=damage
	if hp<=0:
		died.emit()
		Priorities.remove_action(id)
		await get_tree().create_timer(0.1).timeout
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
