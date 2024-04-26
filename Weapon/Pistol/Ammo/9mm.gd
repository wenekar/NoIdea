extends Node2D

class_name bullet

## Speed of the bullet.
@export var speed: float = 300.0
## How long will the bullet live for in seconds.
@export var lifetime: float = 25.0

## Damage of each bullet.
var m_Damage: float = 9.0
## Internal variable for direction of the bullet.
var m_Direction: Vector2
## Internal variable for keeping track of time passed
var m_Time: float = 0.0

## Initilazes internal variables for the bullet.
func init(damage: float, direction: Vector2):
	m_Direction = direction
	m_Damage = damage

func _ready():
	assert(m_Damage, "Damage unset.")
	assert(m_Direction, "Direction unset.")
	

func _physics_process(delta):
	position += speed * m_Direction * delta
	m_Time += delta
	if m_Time > lifetime:
		queue_free()
	pass

## Hit a body, do hit checks.
func _on_body_entered(body):
	
	pass # Replace with function body.
