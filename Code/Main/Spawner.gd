extends Node3D

@export var frog_scene: PackedScene
@export var spawn_interval: float = 1.2 # Time in seconds between frog spawns
@export var spawn_positions: Array[Vector3] = [Vector3(10, 0, -3), Vector3(7, 0, 0), Vector3(5, 0, 3)]

var timer = 0.0

func _process(delta):
	timer += delta
	if timer >= spawn_interval:
		timer = 0.0
		spawn_frog()

func spawn_frog():
	var frog_instance = frog_scene.instantiate()
	var spawn_pos = spawn_positions[randi() % spawn_positions.size()]
	frog_instance.position = spawn_pos
	add_child(frog_instance)
	print("Frog spawned at position: ", spawn_pos)
