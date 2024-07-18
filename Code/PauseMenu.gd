extends Control

@onready var resume_button = $Resume
@onready var quit_button = $Quit


func _ready():
	self.visible = false
	resume_button.pressed.connect(_on_resume_pressed)
	quit_button.pressed.connect(_on_quit_pressed)


func _on_resume_pressed():
	get_tree().paused = false
	hide()
	print("Resume button pressed")


func _on_quit_pressed():
	get_tree().quit()
	print("Quit button pressed")
