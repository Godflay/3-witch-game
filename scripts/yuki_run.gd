extends State
class_name yuki_run

@export var speed := float(50)
@export var sprite : AnimationPlayer
@onready var yuki: CharacterBody2D = $"../.."


func Enter():
	print("running")
	sprite.play("run")
	
func Update(_delta):
	print("getting player node")
	var player = get_tree().get_first_node_in_group("player") as CharacterBody2D
	var direction = player.position - yuki.position as Vector2
	
	yuki.velocity = direction.normalized() * speed
	yuki.move_and_slide()
	print("moving")
	if direction:
		print("are we moving")
		state_transition.emit(self, "yuki_run")
