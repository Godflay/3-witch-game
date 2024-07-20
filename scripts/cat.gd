extends CharacterBody2D

const speed = 65
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

#this var needs to be linked with the player node in the inspector
@export var player: Node2D


@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var animated_sprite:AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	pass
	#path finder stuff shamlessly copy pasted
	#var direction = to_local(nav_agent.get_next_path_position()).normalized()
	
	#flip sprite
	#if velocity.x > 0 and direction:
	#	animated_sprite.flip_h = false
	#elif velocity.x < 0 and direction:
	#	animated_sprite.flip_h = true

	#move logic
	#if direction:
		#if we did not reach the player
	#	if nav_agent.is_navigation_finished() == false:
			#we move
	#		velocity = direction * speed
			#animated_sprite.play("run")
			#animated_tree.set("parameters/moving_anims/current_state/input_1/run", 1)
			#current_anim = RUN
			#animated_tree["parameters/conditions/is_moving"] = true
			#animated_tree["parameters/conditions/idle"] = false
			#animated_tree["parameters/conditions/is_sleeping"] = false
		#if we did reach the player
	#	if nav_agent.is_navigation_finished() == true:
			#we stop moving
	#		velocity.y = 0
	#		velocity.x = 0
			#animated_sprite.play("idle")	
			#TODO: this code doesn't work. figure out how to stop sleeping loop
			#await get_tree().create_timer(5.0).timeout
			#for some reason .stop just crashes the whole thing
			#animated_sprite.pause()
			#we delete the idle animation
			#animated_sprite.sprite_frames.remove_animation("idle")
			# we add it back otherwise the code crashes
			#animated_sprite.sprite_frames.add_animation("idle")
			#we manually set the animation we want to play
			#animated_sprite.set_animation("sleep")
			#we actually play the animation
			#animated_sprite.play("sleep")
				#animated_sprite.pause()
			#var frame_count = animated_sprite.sprite_frames.get_frame_count("sleep")
			#only_once = true
		
			
			#while animated_sprite.sprite_frames.get_animation_loop("idle") == true:
			#	animation_finished()
			#	break
			#if animated_sprite.is_playing():
			#	animated_sprite.sprite_frames.add_animation("idle")
			#	var frame_count = animated_sprite.sprite_frames.get_frame_count("sleep")
			#	print(frame_count)
			#	animated_sprite.sprite_frames.set_animation_loop("sleep", false)
			#	animated_sprite.play("sleep")
			#	if frame_count == 8 and animated_sprite.is_playing():
			#		animated_sprite.pause()
	#move_and_slide()

#this function updates the pathfinder 10 times/sec
#func _on_timer_timeout() -> void:
#	makepath()

#more pathfinder stuff
#func makepath() -> void:
#	nav_agent.target_position = player.global_position
