extends Control
class_name languagemenu

@onready var english = $MarginContainer/HBoxContainer/VBoxContainer/English as Button
@onready var french = $MarginContainer/HBoxContainer/VBoxContainer/French as Button
@onready var german = $MarginContainer/HBoxContainer/VBoxContainer/German as Button
@onready var back = $MarginContainer/HBoxContainer/VBoxContainer/Exit as Button
@onready var main_menu = preload("res://scenes/menus/main_menu.tscn") as PackedScene
@onready var language_menu = preload("res://scenes/menus/language_menu.tscn") as PackedScene

@onready var current_language = ""
#signal exit_language_menu

func _ready():
	back.button_down.connect(on_exit)
	print("click on back button")
	#set_process(false)

#func transfer_data(old_scene, new_scene):
	
    #old_scene.current_language = new_scene.current_language


func on_exit() -> void:
	get_tree().change_scene_to_packed(main_menu)
	current_language = current_language
	#transfer_data(language_menu, main_menu)
	#exit_language_menu.emit()
	#set_process(false)

func handle_language_change():
	if on_english_button_up() == true:
		current_language = "en"
		return
	elif on_french_button_up() == true:
		current_language = "fr"
		return
	elif on_german_button_up() == true:
		current_language = "de"
		return

func on_english_button_up():
	TranslationServer.set_locale("en")

func on_french_button_up():
	TranslationServer.set_locale("fr")

func on_german_button_up():
	TranslationServer.set_locale("de")
