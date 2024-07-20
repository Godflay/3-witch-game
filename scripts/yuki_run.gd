extends State
class_name yuki_run

@export var speed := float(60)
@onready var sprite = $"../../AnimatedSprite2D"
@onready var yuki: CharacterBody2D = $"../.."
var player: CharacterBody2D

func Enter():
	#we enter this state and we get the first node which is the player
	player = get_tree().get_first_node_in_group("player") as CharacterBody2D
	sprite.play("run")
	
func Physics_Update(_delta):
	# we substract the cat's location with the player's location and we move that
	var direction = player.global_position - yuki.global_position
	
	#if the length of the direction is bigger than .5 px
	if direction.length() > 0.5:
		#we add velocity
		yuki.velocity = direction.normalized() * speed
	else:
		#if we aren't moving, we set the velocity to none
		yuki.velocity = Vector2()
		# then move back to the idle state
		state_transition.emit(self, "idle")

