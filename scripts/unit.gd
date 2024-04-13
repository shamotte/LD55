extends CharacterBody2D

@export var range = 10
@export var speed = 100
var target: Vector2 = Vector2(100, 100)
var item_equipped = Global.ITEM.AXE

@onready var agent : NavigationAgent2D = %NavAgent
var priorities = [2,2,1,1,1,1] #tablica wskazująca priorytety danych akcji w takiej samej kolejności jak w enumie Priorities.ACTIONTYPES

var current_action: Priorities.action = null
var work_time: float
func _ready():
	pass


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index ==1 and event.is_pressed():
			pass
			

enum STATES  { WORK, WALK, IDLE}
var state: STATES = STATES.IDLE

func _process(delta):
	
	match state:
		STATES.IDLE:
			print("idle")
			current_action = Priorities.get_action(priorities)
			if current_action != null:
				state = STATES.WALK
		STATES.WALK:
			target = current_action.node.position
			agent.target_position = target
			if agent.distance_to_target() < range :
				print("doszedl")
				state = STATES.WORK
				work_time = current_action.time
		STATES.WORK:
			if agent.distance_to_target() > range:
				state = STATES.WALK
			
			work_time -=delta
			if work_time<=0:
				state = STATES.IDLE
				print("koniec pracy")
			
			
			
	
		
		
	#if  current_action == null:
		#print("nowa akcja")
		#current_action =  Priorities.get_action(priorities)
	
	#var action = Priorities.get_action(priorities)
	#if action != null and current_action != null:
		#if priorities[action.type] > priorities[current_action.type]:
			#Priorities.return_action(current_action)
			#current_action = action
		
		

func _physics_process(delta):
	if global_position.distance_to(target) >=range:
		var direction = agent.get_next_path_position() - global_position
		direction = direction.normalized()
		velocity = velocity.lerp(direction * speed , 0.25)
		move_and_slide()
