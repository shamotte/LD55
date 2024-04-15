extends Node

@onready var player = AudioStreamPlayer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	player.stream = load("res://sounds/monmon2.mp3")
	get_parent().add_child(player)
	get_parent().finished.connect(queue_free)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not player.is_playing():
		player.play()
