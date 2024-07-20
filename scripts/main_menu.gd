extends Control
class_name main_menu

@onready var play = $MarginContainer/HBoxContainer/VBoxContainer/PLAY as Button
@onready var quit = $MarginContainer/HBoxContainer/VBoxContainer/QUIT as Button
@onready var start_level = preload("res://scenes/game.tscn") as PackedScene


func _ready():
	play.button_down.connect(on_play)
	quit.button_down.connect(on_quit)

func on_play() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_quit() -> void:
	get_tree().quit()
