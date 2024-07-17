extends CharacterBody2D
class_name YukiBase

@export var sprite : AnimatedSprite2D
@export var flipped_horizontal : bool

func _ready():
	pass
	
func _process(_delta):
	turn()
	
func turn():
	var direction = -1 if flipped_horizontal == true else 1
	
	if(velocity.x < 0):
		sprite.scale.x = -direction
	elif(velocity.x > 0):
		sprite.scale.x = direction
