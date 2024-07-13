extends CharacterBody2D

const speed = 60
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

#this var needs to be linked with the player node in the inspector
@export var player: Node2D

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	#add gravity
	if not is_on_floor():
		velocity.y += gravity * delta

#path finder stuff shamlessly copy pasted
	var direction = to_local(nav_agent.get_next_path_position()).normalized()
	#move
	velocity = direction * speed
	if velocity.x > 0:
		animated_sprite.flip_h = false
		animated_sprite.play("run")
	elif velocity.x < 0:
		animated_sprite.flip_h = true
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	move_and_slide()

#this function updates the pathfinder 10 times/sec
func _on_timer_timeout() -> void:
	makepath()

#more pathfinder stuff
func makepath() -> void:
	nav_agent.target_position = player.global_position
