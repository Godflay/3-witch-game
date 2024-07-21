extends State
class_name player_idle

@export var player: CharacterBody2D
@onready var sprite = $"../../AnimationPlayer"

func Enter():
    sprite.play("idle")

func Update(_delta:float):
    pass

func Physics_Update(delta: float):
    var direction := Input.get_axis("a", "d")
    if direction:
        state_transition.emit(self, "run")
