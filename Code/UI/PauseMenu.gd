extends Control

@onready var resume_button = $Resume
@onready var quit_button = $Quit


func _ready():
	self.visible = false
	
#attempted to set focus on UI element to prevent conflictions, didn't work.
func _process(_delta: float):
	if get_tree().paused:
		self.visible = true
		grab_focus()
	else:
		self.visible = false
		

#These buttons do nothing?? WHY?!?!?
func _on_resume_pressed():
	get_tree().paused = false
	hide()
	print("Resume button pressed")


func _on_quit_pressed():
	get_tree().quit()
	print("Quit button pressed")
	
	
	
	
	
	
	#Attempt to fix another way failed. "F" button works when menu is not open, but once open no longer quits game.
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

