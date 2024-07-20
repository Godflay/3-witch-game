extends Control
class_name main_menu

@onready var play = $MarginContainer/HBoxContainer/VBoxContainer/PLAY as Button
@onready var quit = $MarginContainer/HBoxContainer/VBoxContainer/QUIT as Button
@onready var language = $MarginContainer/HBoxContainer/VBoxContainer/LANGUAGE as Button
@onready var start_level = preload("res://scenes/game.tscn") as PackedScene
@onready var click = $click
@onready var select = $select


func _ready():
	translateUI()
	play.button_down.connect(on_play)
	quit.button_down.connect(on_quit)
	_on_play_mouse_entered()
	_on_language_mouse_entered()
	_on_quit_mouse_entered()
	_on_quit_pressed()
	_on_play_pressed()

func on_play() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_quit() -> void:
	get_tree().quit()

func translateUI():
	play.text = tr("PLAY_BUTTON")
	quit.text = tr("QUIT_BUTTON")
	language.text = tr("LANGUAGE")

func _on_play_mouse_entered() -> void:
	print("mouse enter play, playing")
	if _on_play_mouse_entered:
		select.play()


func _on_quit_mouse_entered() -> void:
	print("mouse enter quit, playing")
	if _on_quit_mouse_entered:
		select.play()

func _on_language_mouse_entered() -> void:
	print("mouse enter languages, playing")
	if _on_language_mouse_entered:
		select.play()

func _on_quit_pressed() -> void:
	print("quit is pressed, play and leave")
	click.play()


func _on_play_pressed() -> void:
	print("play is pressed, play")
	click.play()

