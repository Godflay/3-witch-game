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
	handle_connections()

func on_play() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_language():
	print("clicked on languages")

func on_quit() -> void:
	get_tree().quit()

func handle_connections() -> void:
	play.button_up.connect(on_play)
	language.button_up.connect(on_language)
	quit.button_up.connect(on_quit)

func translateUI():
	play.text = tr("PLAY_BUTTON")
	quit.text = tr("QUIT_BUTTON")
	language.text = tr("LANGUAGE")

func _on_play_mouse_entered() -> void:
	select.play()

func _on_quit_mouse_entered() -> void:
	select.play()

func _on_language_mouse_entered() -> void:
	select.play()

func _on_quit_pressed() -> void:
	click.play()

func _on_play_pressed() -> void:
	click.play()

func _on_language_pressed() -> void:
	click.play()