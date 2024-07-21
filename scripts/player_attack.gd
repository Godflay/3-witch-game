extends State
class_name player_attack

@onready var sprite = $"../../AnimationPlayer"
@onready var player: CharacterBody2D = $"../.."
@export var attacking = false

func Enter():
    sprite.play("attack")

func Physics_Update(delta):
    
    if Input.is_action_just_pressed("attack"):
        attacking = true

    var direction := Input.get_axis("a", "d")	
    if direction:
        state_transition.emit(self, "run")
    else:
        state_transition.emit(self, "idle")