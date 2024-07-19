extends State
class_name yuki_run

@export var speed := float(60)
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
	
	if direction.length() > 0.5:
		yuki.velocity = direction.normalized() * speed
		print("moving")
	else:
		yuki.velocity = Vector2()
		print("are we no longer moving")
		state_transition.emit(self, "idle")

