extends State
class_name cat_idle

@export var sprite : AnimatedSprite2D

func Enter():
	pass
	#sprite.play("idle")
	
func Exit():
	pass
	
func Update(_delta:float):
	if get_tree().create_timer(5.0).timeout:
		state_transition.emit(self, "sleeping")
