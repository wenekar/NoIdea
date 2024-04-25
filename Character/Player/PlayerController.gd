extends CharacterBody2D

@export var SPEED: float = 300.0

func _process(_delta):
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED

func _physics_process(_delta):
	move_and_slide()
