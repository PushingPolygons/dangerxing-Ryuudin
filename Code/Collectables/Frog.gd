extends Node3D

@export var points: int = 1
@onready var player = get_tree().root.get_node("res://Main/Player.gd")

@export var move_speed: float = 10.0
@onready var frog_sensor = $FrogSensor


func _ready():
	frog_sensor.enabled = true
	frog_sensor.connect("body_entered", self, "_on_body_entered")
	
func _on_FrogSensor_body_entered(body):
	print("Body entered:", body.name)
	if body.is_in_group("Player"):
		var player = body.get_parent().get_node("Player")  # Check if the colliding body belongs to "Player" group
		collect()  # Remove the frog from the scene

func collect():
	queue_free()
	
func _process(delta):
	translate(Vector3(-move_speed * delta, 0, 0))
