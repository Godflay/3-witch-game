extends CharacterBody2D
class_name yukii
@onready var sprite = $AnimatedSprite2D

func _physics_process(delta):
	move_and_slide()
	
	if velocity.length() > 0:
		sprite.play("run")
		
	if velocity.x > 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
