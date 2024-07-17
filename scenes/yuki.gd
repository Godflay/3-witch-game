extends YukiBase
class_name YukiMain

@onready var sm = $StateMachine as FiniteStateMachine
@export var run_node = Node
var player_in_range = false

func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true
		
		if sm.current_state.name == "yuki_idle":
			print("current state is idle, switching to run")
			sm.force_change_state("yuki_run")
