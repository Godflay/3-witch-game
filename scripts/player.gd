extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: Sprite2D = $Sprite2D
@onready var animated_player: AnimationPlayer = $AnimationPlayer


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:

	var direction := Input.get_axis("a", "d")	
	#flip sprite when movie left or right
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	move_and_slide()

func player():
	pass
