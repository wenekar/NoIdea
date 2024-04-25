extends Area2D

class_name bullet

var direction: Vector2
@export var speed: float = 100.0

func _physics_process(delta):
	position += speed * direction * delta
	pass
