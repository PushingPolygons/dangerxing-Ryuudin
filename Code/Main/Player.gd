extends CharacterBody3D

var positions = [-3,0,3]
var curPos = 1


var swipeLength = 100
var startSwipe: Vector2
var curSwipe: Vector2
var swiping = false
var threshold = 50

var swipeDir = 0

const JUMP_VEL = 7
var gravity = ProjectSettings.get_setting ("physics/3d/default_gravity")

@onready var death_sensor = $DeathSensor


func _process(delta):
	swipe()
	if swipeDir == 1:
		if curPos <2:
			curPos += 1
			position.z = position[curPos]
	elif swipeDir == -1:
		if curPos >  0:
			curPos -= 1
			position.z = position[curPos]
			
	if death_sensor.is_colliding():
		death()
		
func death():
	get_tree().reload_current_scene()

func swipe():
	var swipeLength = 1
	var startSwipe: Vector2
	var curSwipe: Vector2
	var swiping = false
	var threshold = 20


	if Input.is_action_just_pressed("press"):
			swiping = true
			startSwipe = get_viewport().get_mouse_position()
			print("Start Positon: ", startSwipe)
	if Input.is_action_just_pressed("press"):
			curSwipe = get_viewport().get_mouse_position()
			if startSwipe.distance_to(curSwipe) >= swipeLength:
				print("Swipe Detected!")
				if startSwipe.x-curSwipe.x < 0:
					swipeDir = 1
				else:
					swipeDir = -1
				swiping = false
	else:
		swiping = false
		
		
func move_left():
	if curPos > 0:
		curPos -= 1
		update_position()

func move_right():
	if curPos < positions.size() - 1:
		curPos += 1
		update_position()

func _input(event):
	if event.is_action_pressed("move_left"):
		move_left()
	if event.is_action_pressed("move_right"):
			move_right()

func update_position():
	var target_position: Vector3
	target_position.x = positions[curPos]
