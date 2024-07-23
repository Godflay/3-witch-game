extends State
class_name player_attack

@onready var sprite = $"../../AnimationPlayer"
@onready var player: CharacterBody2D = $"../.."
@onready var deal_DMG = $"../../dealDMG"

var attack_type: String
var current_attack: bool

func Enter():
    print("entered attack state")
    handle_attack_anims(attack_type)
    #sprite.play("single_attack")

func Physics_Update(delta):
    
    #transitions
    var direction := Input.get_axis("a", "d")	
    if direction:
        state_transition.emit(self, "run")
    else:
        state_transition.emit(self, "idle")

    if !current_attack:
        if Input.is_action_just_pressed("attack") or Input.is_action_just_pressed("charge"):
            current_attack = true
            if Input.is_action_just_pressed("attack") and player.is_on_floor():
                attack_type = "single"
                sprite.play("single_attack")
            elif Input.is_action_just_pressed("charge") and player.is_on_floor():
                attack_type = "double"
                sprite.play("double_attack")
            handle_attack_anims(attack_type)


func handle_attack_anims(attack_type):
    if current_attack:
        var anim = str(attack_type, "_attack")
        sprite.play(anim)