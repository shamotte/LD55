extends Node

enum ACTIONTYPES {GATHERWOOD =0, GATHERROCK,GATHERIRON,GATHERFOOD,GATHERGOLD,CRAFT,FIGHT}

func get_action_name(index:int) -> String:

	match index:
		0:
			return "wood"
		1:
			return "rock"
		2: return "iron"
		3: return "food"
		4: return "gold"
		5: return "craft"
		6: return "FIGHT"
	return "error_string"
		


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

func remove_action(id:int):
	for elem in aveilable:
		if elem.id == id:
			aveilable.erase(elem)
			break
func remove_action_null_node(act :action):
	aveilable.erase(act)
	
func return_action(act: action):
	aveilable.append(act)
	
func get_action(a)->action:
	aveilable.sort_custom(func(l,r):return a[l.type]>a[r.type])
	if not aveilable.is_empty():
		if aveilable[0].type == ACTIONTYPES.FIGHT:
			return aveilable[0]
		else:
			return aveilable.pop_front()
	return null
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
