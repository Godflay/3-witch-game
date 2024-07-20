extends State
class_name cat_moving

@export var speed := float(60)
var player: CharacterBody2D
@onready var sprite = $"../../AnimatedSprite2D"
@onready var ellie: CharacterBody2D = $"../.."

func Enter():
	player = get_tree().get_first_node_in_group("player") as CharacterBody2D
	print("running")
	sprite.play("run")
	
func Physics_Update(_delta):
	print("getting player node")
	var direction = player.global_position - ellie.global_position
	
	if direction.length() > 0.5:
		ellie.velocity = direction.normalized() * speed
		print("moving")
	else:
		ellie.velocity = Vector2()
		print("are we no longer moving")
		if get_tree().create_timer(5.0).timeout:
			state_transition.emit(self, "sleeping")
		else:
			state_transition.emit(self, "idle")
