extends State
class_name player_run

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var sprite = $"../../AnimationPlayer"
@onready var player: CharacterBody2D = $"../.."
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var current_attack: bool

func Enter():
    sprite.play("run")

func Physics_Update(delta):
    	# Add the gravity.
 if not player.is_on_floor():
    player.velocity.y += gravity * delta

	# Handle jump.
 if Input.is_action_just_pressed("jump") and player.is_on_floor():
    player.velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
 var direction := Input.get_axis("a", "d")	

 if direction and !current_attack:
    print("got input, moving")
    player.velocity.x = direction * SPEED
 else:
    player.velocity.x = move_toward(player.velocity.x, 0, SPEED)
    print("we're idle")
    state_transition.emit(self, "idle")