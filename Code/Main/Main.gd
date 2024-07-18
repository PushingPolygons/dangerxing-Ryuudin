extends Node

@onready var pause_button = $PauseButton
var pause_menu

func _ready():
	var pause_menu_scene = load("res://UI/pause_menu.tscn")
	if pause_menu_scene:
		pause_menu = pause_menu_scene.instantiate()
		add_child(pause_menu)
		pause_menu.hide()
	else:
		print("Failed to load PauseMenu.tscn")
		
	pause_button.pressed.connect(_on_PauseButton_pressed)
	
func _input(event):
	if event.is_action_pressed("ui_pause"):
		_on_PauseButton_pressed()

func _on_pause_button_pressed():
	get_tree().paused = true
	pause_menu.visible = true


func _on_PauseButton_pressed():
	get_tree().paused = true
	pause_menu.show()
