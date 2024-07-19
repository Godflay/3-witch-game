extends State
class_name yuki_idle

@export var yuki: CharacterBody2D
@onready var sprite = $"../../AnimatedSprite2D"


var player : CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("player")
	print("got player node")
	print("idle state")
	sprite.play("idle")

func Update(_delta:float):
	pass

func Physics_Update(delta: float):
	var direction = player.global_position - yuki.global_position
	if direction.length() > 25:
		state_transition.emit(self, "run")
