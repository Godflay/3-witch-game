extends State
class_name cat_idle

@onready var sprite = $"../../AnimatedSprite2D" 
@onready var ellie: CharacterBody2D = $"../.."

var player : CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("player")
	sprite.play("idle")

func Update(_delta:float):
	pass

func Physics_Update(delta: float):
	var direction = player.global_position - ellie.global_position
	if direction.length() > 0.5:
		state_transition.emit(self, "run")
	else:
		await get_tree().create_timer(5.0).timeout
		state_transition.emit(self, "sleep")
