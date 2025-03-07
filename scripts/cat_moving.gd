extends State
class_name cat_moving

@export var speed := float(60)
@onready var sprite = $"../../AnimatedSprite2D"
@onready var ellie: CharacterBody2D = $"../.."
var player: CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("player") as CharacterBody2D
	sprite.play("run")
	
func Physics_Update(_delta):
	var direction = player.global_position - ellie.global_position
	
	if direction.length() > 0.5:
		ellie.velocity = direction.normalized() * speed
	else:
		ellie.velocity = Vector2()
		state_transition.emit(self, "idle")
