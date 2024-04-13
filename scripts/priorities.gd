extends Node

enum ACTIONTYPES {GATHERWOOD =0, GATHERROCK,GATHERIRON,GATHERFOOD,GATHERGOLD,CRAFT}

class action:
	var type: ACTIONTYPES
	var id : int
	var node :Node2D
	var time : float
	func _init(t,i,n,ti):
		type = t
		id = i
		node = n
		time = ti

var aveilable = [] 

var id = 0
func get_id() -> int:
	id+=1
	return id
	


func add_action(type : ACTIONTYPES,id : int, node :Node2D,time : float):
	aveilable.append(action.new(type,id,node,time))
	
func return_action(act: action):
	aveilable.append(act)
	
func get_action(a)->action:
	aveilable.sort_custom(func(l,r):return a[l.type]>a[r.type])
	return aveilable.pop_front()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
