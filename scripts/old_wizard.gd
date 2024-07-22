extends CharacterBody2D

var player_in_area = false
@onready var wizard_met = false

func _process(delta):
	if player_in_area:
		#if we haven't met the wizard yet, we go through the campaign dialogue
		if Input.is_action_just_pressed("e") and wizard_met == false:
			wizard_meeting()
		#otherwise, we go through a loop of 3 dialogues to make player progress
		elif Input.is_action_just_pressed("e") and wizard_met == true:
			wizard_main_loop()

func run_dialogue(dialogue_string):
	Dialogic.start(dialogue_string)

func _on_area_2d_body_entered(body):
	#we added an empty function "player" inside the player script just for this
	if body.has_method("player"):
		player_in_area = true

func _on_area_2d_body_exited(body:Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false

func wizard_meeting():
	run_dialogue("wizard_meeting")
	wizard_met = true

func wizard_main_loop():
	var dialogue_line = randi_range(1,3)
	Dialogic.start("wizard_loop_" + str(dialogue_line))