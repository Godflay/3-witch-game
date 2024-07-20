extends State
class_name cat_sleeping

@export var sprite : AnimatedSprite2D
@onready var ellie: CharacterBody2D = $"../.."
var player: CharacterBody2D

func Enter():
	sprite.play("sleeping")

func Physics_Update(_delta):
	var direction = player.global_position - ellie.global_position
	if direction.length() > 0.5:
		state_transition.emit(self, "run")
