extends Control
class_name mainmenu

#menus stuff
#@onready var language_menu = $language_menu as languagemenu
#@onready var margin = $Margin as MarginContainer
@onready var language_menu = $Margin/LANGUAGE
@onready var menu = $Margin/Menu

#buttons
@onready var play = $Margin/Menu/VBoxContainer/PLAY as Button
@onready var quit = $Margin/Menu/VBoxContainer/QUIT as Button
@onready var language = $Margin/Menu/VBoxContainer/LANGUAGE as Button

@onready var start_level = preload("res://scenes/game.tscn") as PackedScene

#audio stuff
@onready var click = $click
@onready var select = $select


func _ready():
	translateUI()
	handle_connections()

#we press on play button, we load the game
func on_play() -> void:
	get_tree().change_scene_to_packed(start_level)

#we press on quit game, we quit
func on_quit() -> void:
	get_tree().quit()

#func on_exit_menu() -> void:
#	margin.visible = true
#	language_menu.visible = false

#function to handle signals for the button presses
func handle_connections() -> void:
	play.button_up.connect(on_play)
	language.button_up.connect(on_language_pressed)
	quit.button_up.connect(on_quit)
	#language_menu.exit_language_menu.connect(on_exit_menu)

#function to handle the translation, is set to local language by default
func translateUI():
	play.text = tr("PLAY_BUTTON")
	quit.text = tr("QUIT_BUTTON")
	language.text = tr("LANGUAGE")

#functions to play SFX
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


func on_language_pressed() -> void:
	show_and_hide(language_menu, menu)

func show_and_hide(first, second):
	first.show()
	second.hide()
