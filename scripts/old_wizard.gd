extends CharacterBody2D

var player_in_area = false

func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("e"):
			run_dialogue("wizard_meeting")

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)
	

func _on_chatdetection_body_entered(body):
	if body.has_method("player"):
		player_in_area = true


func _on_chatdetection_body_exited(body):
	if body.has_method("player"):
		player_in_area = false
