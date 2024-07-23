extends State
class_name player_idle

@export var player: CharacterBody2D
@onready var sprite = $"../../AnimationPlayer"
@onready var current_attack: bool
@onready var attack_type: String

func Enter():
    sprite.play("idle")

func Physics_Update(delta: float):
    var direction := Input.get_axis("a", "d")
    if direction:
        state_transition.emit(self, "run")

    if !current_attack:
        if Input.is_action_just_pressed("attack") or Input.is_action_just_pressed("charge"):
            current_attack = true
            if Input.is_action_just_pressed("attack") and player.is_on_floor():
                attack_type = "single"
            elif Input.is_action_just_pressed("charge") and player.is_on_floor():
                attack_type = "double"
            handle_attack_anims(attack_type)
            #state_transition.emit(self, "attack")

func handle_attack_anims(attack_type):
    if current_attack:
        var anim = str(attack_type, "_attack")
        sprite.play(anim)