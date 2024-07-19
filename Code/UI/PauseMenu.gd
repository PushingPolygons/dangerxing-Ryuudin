extends Control

@onready var resume_button = $Resume
@onready var quit_button = $Quit


func _ready():
	self.visible = false


func _on_resume_pressed():
	get_tree().paused = false
	hide()
	print("Resume button pressed")


func _on_quit_pressed():
	get_tree().quit()
	print("Quit button pressed")
	
	

func _input(event):
	if event.is_action_pressed("exit"):
		leavegame()
	if event.is_action_pressed("resume"):
		resume()

func leavegame():
	get_tree().quit()
	
func resume():
	get_tree().paused = false
	self.hide()
	print("Resume button pressed")

