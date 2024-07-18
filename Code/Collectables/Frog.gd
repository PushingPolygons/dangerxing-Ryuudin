extends Node3D

@export var points: int = 1

@export var move_speed: float = 10.0
@onready var frog_sensor = $FrogSensor



func _ready():
	frog_sensor.enabled = true
	

func collect():
	queue_free()
	
func _process(delta):
	translate(Vector3(-move_speed * delta, 0, 0))
	
	if frog_sensor.is_colliding():
		print("collected")
		collect()
	

