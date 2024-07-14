extends CharacterBody2D

const speed = 60
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

#this var needs to be linked with the player node in the inspector
@export var player: Node2D

@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var animated_sprite:AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	#add gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	#path finder stuff shamlessly copy pasted
	var direction = to_local(nav_agent.get_next_path_position()).normalized()
	
	#move logic
	if direction:
		#if we did not reach the player
		if nav_agent.is_navigation_finished() == false:
			#we move
			velocity = direction * speed
			animated_sprite.play("run")
		#if we did reach the player
		elif nav_agent.is_navigation_finished() == true:
			#we stop moving
			velocity.y = 0
			velocity.x = 0
			animated_sprite.play("idle")
			#TODO: this code doesn't work. figure out how to swap idle animations...
			await get_tree().create_timer(5.0).timeout
			print("waited 5 seconds, sleeping")
			animated_sprite.sprite_frames.remove_animation("idle")
			print("animation cleared")
			animated_sprite.play("sleep")
			animated_sprite.sprite_frames.get_animation_loop("sleep")
			animated_sprite.sprite_frames.set_animation_loop("sleep", false)
			
	move_and_slide()

	#flip sprite
	if velocity.x > 0 and direction:
		animated_sprite.flip_h = false
	elif velocity.x < 0 and direction:
		animated_sprite.flip_h = true

#this function updates the pathfinder 10 times/sec
func _on_timer_timeout() -> void:
	makepath()

#more pathfinder stuff
func makepath() -> void:
	nav_agent.target_position = player.global_position
