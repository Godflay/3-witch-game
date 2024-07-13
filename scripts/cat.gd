extends Node2D

const speed = 60
var direction = 1

@onready var raycast_right = $RayCastRight
@onready var raycast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
@onready var area2d = $Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if raycast_right.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	if raycast_left.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	position.x += direction * speed * delta
