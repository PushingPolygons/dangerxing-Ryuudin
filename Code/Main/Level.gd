extends Node3D

@export var modules: Array[PackedScene] = []
var amnt = 10
var rng = RandomNumberGenerator.new()
var offset = 5

var FirstObs = 0


func _ready():
	for n in amnt:
		spawnModule(n*offset)


func spawnModule(n):
	if FirstObs > 10:
		rng.randomize()
		var num = rng.randi_range(0,modules.size()-1)
		var instance =modules[num].instantiate()
		instance.position.x = n
		add_child(instance)
	else: 
		var instance =modules[4].instantiate()
		instance.position.x = n
		add_child(instance)
		FirstObs += 1
