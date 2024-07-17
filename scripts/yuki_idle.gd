extends State
class_name yuki_idle

@onready var sprite: AnimationPlayer = $"../../AnimationPlayer"


func Enter():
	print("idle state")
	sprite.play("idle")
	pass

func Update(_delta:float):
	pass
