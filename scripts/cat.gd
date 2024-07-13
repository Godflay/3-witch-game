extends CharacterBody2D

const speed = 60
var direction = {}


@export var player: Node2D
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var animated_sprite = $AnimatedSprite2D
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta: float) -> void:
	# add gravity
	var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
	
	
	var idle = nav_agent.is_navigation_finished()
	
	if idle == true:
		direction = 0
	else:
		direction = to_local(nav_agent.get_next_path_position()).normalized()
		velocity = direction * speed
		move_and_slide()

func makepath() -> void:
	nav_agent.target_position = player.global_position
	
	print(direction)


func _on_timer_timeout() -> void:
	makepath()
