extends CharacterBody3D

var positions = [-3,0,3]
var curPos = 1


var swipeLength = 50
var startSwipe: Vector2
var curSwipe: Vector2
var swiping = false
var threshold = 20

var swipeDir = 0
var swipeDone = false

var moveLeftExecuted = false
var moveRightExecuted = false

const JUMP_VEL = 7
var gravity = ProjectSettings.get_setting ("physics/3d/default_gravity")

@onready var death_sensor = $DeathSensor
@onready var hud_scene = preload("res://Main/HUD.tscn")

var hud

var score = 0

func _ready():
	if hud: 
		print("Hud Found")
	else:
		print ("Not found")

func _process(_delta):
	Swipe()
	if swipeDir == 1 and !swipeDone:
		if curPos < positions.size() - 1:
			curPos += 1
			position.z = positions[curPos]
		swipeDone = true
		swipeDir = 0  # Reset swipeDir after the action
	elif swipeDir == -1 and !swipeDone:
		if curPos > 0:
			curPos -= 1
			position.z = positions[curPos]
		swipeDone = true
		swipeDir = 0  # Reset swipeDir after the action

	if moveLeftExecuted:
		if curPos > 0:
			curPos -= 1
			position.z = positions[curPos]
			moveLeftExecuted = false

	if moveRightExecuted:
		if curPos < positions.size() - 1:
			curPos += 1
			position.z = positions[curPos]
			moveRightExecuted = false

	if Input.is_action_just_pressed("move_left"):
		moveLeftExecuted = true

	if Input.is_action_just_pressed("move_right"):
		moveRightExecuted = true

	if death_sensor.is_colliding():
		death()



func death():
	get_tree().reload_current_scene()
	
	
func Swipe():
	if Input.is_action_just_pressed("press"):
		swiping = true
		startSwipe = get_viewport().get_mouse_position()
		swipeDone = false
		print("Start Position: ", startSwipe)

	if swiping and Input.is_action_pressed("press"):
		curSwipe = get_viewport().get_mouse_position()
		if startSwipe.distance_to(curSwipe) >= swipeLength:
			if curSwipe.x > startSwipe.x + threshold:
				swipeDir = 1  # Swipe right
				print("Swiped Right")
			elif curSwipe.x < startSwipe.x - threshold:
				swipeDir = -1  # Swipe left
				print("Swiped Left")
				swiping = false  # Reset swiping after detecting a swipe

	if Input.is_action_just_released("press"):
		swiping = false
		
	

