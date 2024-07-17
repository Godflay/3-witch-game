extends State
class_name cat_moving

@export var sprite : AnimatedSprite2D

func Enter():
	sprite.play("sleeping")
	
func Exit():
	pass
	
func Update(_delta:float):
	pass


