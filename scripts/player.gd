extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite: Sprite2D = $Sprite2D
@onready var animated_player: AnimationPlayer = $AnimationPlayer
@export var attacking = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		attack()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("a", "d")
	if direction and attacking == false:
		velocity.x = direction * SPEED
		animated_player.play("run")
	else:
		animated_player.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	#flip sprite when movie left or right
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#play animations
	#if is_on_floor():
		#if direction == 0 and !attacking:
		#	animated_sprite.play("idle")
		#else:
			#animated_sprite.play("run")

	move_and_slide()

func attack():
	attacking = true
	animated_player.play("attack")
	animated_sprite.position.x = 30
