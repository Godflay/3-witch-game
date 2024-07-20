extends Control
class_name languagemenu

@onready var english = $MarginContainer/HBoxContainer/VBoxContainer/English as Button
@onready var french = $MarginContainer/HBoxContainer/VBoxContainer/French as Button
@onready var german = $MarginContainer/HBoxContainer/VBoxContainer/German as Button
@onready var back = $MarginContainer/HBoxContainer/VBoxContainer/Exit as Button

signal exit_language_menu

func _ready():
    back.button_down.connect(on_exit)
    set_process(false)

func on_exit() -> void:
    exit_language_menu.emit()
    set_process(false)