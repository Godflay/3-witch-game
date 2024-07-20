extends State
class_name yuki_idle

@export var yuki: CharacterBody2D
@onready var sprite = $"../../AnimatedSprite2D"


var player : CharacterBody2D

func Enter():
	#same here, when we enter the idle state, which is the default state, we get the player node
	player = get_tree().get_first_node_in_group("player")
	sprite.play("idle")

func Update(_delta:float):
	pass

func Physics_Update(delta: float):
	var direction = player.global_position - yuki.global_position
	#if the length of the direction is bigger than .5px we enter the run state
	if direction.length() > 0.5:
		state_transition.emit(self, "run")
