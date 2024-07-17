extends State
class_name yuki_run

@export var speed := float(50)
@onready var sprite = $"../../AnimatedSprite2D"

@onready var yuki: CharacterBody2D = $"../.."
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("player") as CharacterBody2D
	print("running")
	sprite.play("run")
	
func Physics_Update(_delta):
	print("getting player node")
	var direction = player.global_position - yuki.global_position
	
	if direction.length() > 25:
		yuki.velocity = direction.normalized() * speed
	else:
		yuki.velocity = Vector2()
	print("moving")
	if direction.length() > 50:
		print("are we moving")
		state_transition.emit(self, "idle")

