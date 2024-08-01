extends Node3D

@export var points: int = 1

@export var move_speed: float = 10.0

@onready var frog_sensor = $FrogSensor
@onready var frog_sensor_side = $FrogSensorSide
@onready var frog_sensor_side2 = $FrogSensorSide2
@onready var frog_sensor_rear = $FrogSensorRear

@onready var collect_sound = $CollectSound

func _ready():
	frog_sensor.enabled = true
	print("Ready function called")
	collect_sound.volume_db = 5


func collect():
	print("collected")
	collection_noise()
	queue_free()
	var main = get_tree().root.get_node("Main")
	if main:
		main.add_score(1)
	
func _process(delta):
	translate(Vector3(-move_speed * delta, 0, 0))
	
	if frog_sensor.is_colliding():
		collect()
	if frog_sensor_side.is_colliding():
		collect()
	if frog_sensor_side2.is_colliding():
		collect()
	if frog_sensor_rear.is_colliding():
		collect()


func collection_noise():
	if collect_sound and collect_sound .is_inside_tree():
		if collect_sound .stream:
			print("Playing sound")
			print("Sound stream before play: ", collect_sound.stream)
			collect_sound.play()
			print("Is playing after play() call: ", collect_sound.is_playing())
		else:
			print("Audio stream is not set or invalid")
	else:
		print("Sound player is not available or has been freed.")

