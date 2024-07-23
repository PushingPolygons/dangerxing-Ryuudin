extends Node3D

@export var points: int = 1

@export var move_speed: float = 10.0
@onready var frog_sensor = $FrogSensor

func _ready():
	frog_sensor.enabled = true
	

func collect():
	print("collected")
	queue_free()
	var main = get_tree().root.get_node("Main")
	if main:
		print("Main Scene Found")
		main.add_score(1)
	
func _process(delta):
	translate(Vector3(-move_speed * delta, 0, 0))
	
	if frog_sensor.is_colliding():
		collect()
	

