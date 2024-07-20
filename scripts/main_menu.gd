extends Control
class_name main_menu

@onready var play = $MarginContainer/HBoxContainer/VBoxContainer/PLAY as Button
@onready var quit = $MarginContainer/HBoxContainer/VBoxContainer/QUIT as Button
@onready var start_level = preload("res://scenes/game.tscn") as PackedScene
@onready var click = $click
@onready var select = $select


func _ready():
	_on_play_mouse_entered()
	_on_quit_mouse_entered()
	play.button_down.connect(on_play)
	quit.button_down.connect(on_quit)

func on_play() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_quit() -> void:
	get_tree().quit()


func _on_play_mouse_entered():
	select.play("select")


func _on_quit_mouse_entered() -> void:
	select.play("select")
