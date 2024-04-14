extends CharacterBody2D
class_name unit
@export var range = 10
@export var speed = 100
@export var type:	Global.UNIT = Global.UNIT.IMP
var target: Vector2 = Vector2(100, 100)
var item_equipped = Global.ITEM.AXE


@onready var agent : NavigationAgent2D = %NavAgent
var priorities = [2,3,1,1,1,1] #tablica wskazująca priorytety danych akcji w takiej samej kolejności jak w enumie Priorities.ACTIONTYPES

var current_action: Priorities.action = null
var work_time: float

func _ready():
	$AnimationPlayer.play("spawn")


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index ==1 and event.is_pressed():
			pass
			


enum STATES  { WORK, WALK, IDLE}
var state: STATES = STATES.IDLE

func _process(delta):
	
	match state:
		STATES.IDLE:
			
			current_action = Priorities.get_action(priorities)
			if current_action != null:
				state = STATES.WALK
		STATES.WALK:
			target = current_action.node.position
			agent.target_position = target
			if agent.distance_to_target() < range :
				
				state = STATES.WORK
				work_time = current_action.time
		STATES.WORK:
			if agent.distance_to_target() > range:
				state = STATES.WALK
			
			work_time -=delta
			if work_time<=0:
				$gather.play()
				state = STATES.IDLE
				current_action.node.action_finished()
				
	if state == STATES.WORK or state == STATES.WALK:
		look_for_higher_priority_job()
	
	
func look_for_higher_priority_job():
	var new_job : Priorities.action = Priorities.get_action(priorities)
	if new_job != null and current_action != null:
		if priorities[new_job.type] > priorities[current_action.type]:
			if current_action != null:
				current_action.time = work_time
				Priorities.return_action(current_action)
				current_action = new_job
		else:
			Priorities.return_action(new_job)
			
		
	

func _physics_process(delta):
	if global_position.distance_to(target) >=range:
		var direction = agent.get_next_path_position() - global_position
		direction = direction.normalized()
		velocity = velocity.lerp(direction * speed , 0.25)
		move_and_slide()


func display_previev(node : Control):
		node.unit_selection(self)
	
