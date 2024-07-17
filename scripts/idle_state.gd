extends State

class_name cat_idle
@export var sprite : AnimatedSprite2D

func Enter():
	sprite.play("idle")
	
func Exit():
	pass
	
func Update(_delta:float):
	pass
