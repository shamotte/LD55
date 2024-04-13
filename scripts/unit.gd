extends CharacterBody2D

@export var range = 20
@export var speed = 100
var target: Vector2 = Vector2(100, 100)
var item_equipped = Global.ITEM.AXE

@onready var agent : NavigationAgent2D = %NavAgent
var priorities = [2,1,1,1] #tablica wskazująca priorytety danych akcji w takiej samej kolejności jak w enumie Priorities.ACTIONTYPES

var current_action: Priorities.action = null
func _ready():
	pass


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index ==1 and event.is_pressed():
			pass

func _process(delta):
	if current_action == null:
		current_action = Priorities.get_action(priorities)
		
	if agent.distance_to_target() < range:
		current_action = Priorities.get_action(priorities)
		
		

func _physics_process(delta):
	if current_action != null:
		target = current_action.node.position
		agent.target_position = target
		var direction = agent.get_next_path_position() - global_position
		direction = direction.normalized()
		velocity = velocity.lerp(direction * speed , 0.25)
		move_and_slide()
