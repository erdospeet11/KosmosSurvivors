extends Node2D

@onready var play = $Control/menu/play
@onready var settings = $Control/menu/settings
@onready var quit = $Control/menu/quit

@onready var options = $Control/options
@onready var menu = $Control/menu

func _ready():
	menu.visible = true
	options.visible = false
	quit.connect("pressed", _on_quit_pressed)
	settings.connect("pressed", _on_settings_pressed)

func _process(_delta):
	if Input.is_action_just_pressed("escape") and !menu.visible:
		menu.visible = true
		options.visible = false

func _on_play_pressed():
	print("start")
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_settings_pressed():
	menu.visible = false
	options.visible = true

func _on_quit_pressed():
	get_tree().quit()
