extends Node3D
class_name Frogbody

@export var points: int = 1
@onready var player = get_tree().root.get_node("res://Main/Player.gd")

@export var move_speed: float = 10.0


func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))


func _on_body_entered(body: Node):
	if body.name == "Player":
		collect()
		
		
func collect():
	queue_free()
	
func _process(delta):
	translate(Vector3(-move_speed * delta, 0, 0))
	
