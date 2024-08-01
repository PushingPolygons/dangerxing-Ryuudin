extends Node

@onready var pause_button = $PauseButton
@onready var score_label = $ScoreLabel
var pause_menu

var score = 0

func add_score(points):
	score += points
	update_score_label()
	print("Score: ", score +1)

func update_score_label():
	score_label.text = "Score: " + str(score)
	if score > 5:
		print("Speed increase")

func _ready():
	var pause_menu_scene = load("res://UI/pause_menu.tscn")
	if pause_menu_scene:
		pause_menu = pause_menu_scene.instantiate()
		add_child(pause_menu)
		pause_menu.hide()
	else:
		print("Failed to load PauseMenu.tscn")
		
	pause_button.pressed.connect(_on_Menu_pressed)
	
func _input(event):
	if event.is_action_pressed("ui_pause"):
		_on_Menu_pressed()

func _on_Menu_pressed():
	get_tree().paused = true
	pause_menu.show()
	$PauseButton.hide()
	print("Menu opened with ESC Key")


func _on_button_pressed():
	get_tree().paused = true
	pause_menu.visible = true
	print("Menu Clicked by Mouse")
	
