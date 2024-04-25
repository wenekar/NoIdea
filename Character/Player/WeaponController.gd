extends Node2D

@onready var gun_barrel: Node2D = $Pistol/GunBarrel
@export var pistol_offset: Vector2 = Vector2(-37.5, 62.5)
@export var max_offset_length: float = 72.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	# Get the global mouse pos? That is kinda obvious.
	var mouse_pos: Vector2 = get_global_mouse_position()
	# Calculate the angle between the anchor and the mouse cursor
	var angle = global_position.direction_to(mouse_pos).angle()
	# Calculate the offset based on the angle and max_offset_length
	var offset = Vector2(max_offset_length * cos(angle), max_offset_length * sin(angle))
	# Set the object's global position based on the anchor's position and the offset
	$Pistol.position = offset
	# Set pistol's rotation to mouse cursor
	$Pistol.rotation = $Pistol/GunBarrel.global_position.direction_to(mouse_pos).angle()


func get_angle_from_vector(vector: Vector2) -> float:
	return atan2(vector.y, vector.x)

func convert_radians_to_degrees_0_to_360(radians: float) -> float:
	var degrees = rad_to_deg(radians)
	if degrees < 0:
		degrees += 360
	return degrees
