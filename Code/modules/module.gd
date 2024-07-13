extends Node3D

@onready var level = $"../"
var speed = 10


func _process(delta):
	position.x -= speed * delta
	if position.x < -20:
		level.spawnModule(position.x+(level.amnt*level.offset))
		queue_free()
