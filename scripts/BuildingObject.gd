extends Node2D

var texture = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("spawn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
		
	
func set_texture(newTexture):
	texture = newTexture
	$Sprite2D.texture = newTexture
	$AnimatedSprite2D.animation = "default"
