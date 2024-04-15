extends Node2D
class_name buildingObject
var texture = null
@onready var id = Priorities.get_id()
@export var building_type : Global.BUILDINGS
var recipe #: Global.RECIPES
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("spawn")
	recipe =  Global.buildings[building_type].recipe
	#Priorities.add_action(Priorities.ACTIONTYPES.CRAFT,id,get_node("."),Global.recipes[recipe].work)# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
		
func display_previev(node):
	node.building_selection(get_node("."))
func set_texture(newTexture):
	texture = newTexture
	$Sprite2D.texture = newTexture
	$AnimatedSprite2D.animation = "default"
