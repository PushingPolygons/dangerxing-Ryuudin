extends Node3D

@export var points: int = 1

signal item_collected(points: int)

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node):
	if body.name == "Player":
		emit_signal("collected", points)
		queue_free()
