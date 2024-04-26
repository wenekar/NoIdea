extends Weapon

class_name Pistol
@export var sounds: Array[AudioStream]

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("fire"):
		fire()
		play_audio(sounds.pick_random())
	pass

func fire():
	var bullet_s = preload("res://Weapon/Pistol/Ammo/9mm.tscn")
	var bullet_h = bullet_s.instantiate()
	bullet_h.global_position = $GunBarrel.global_position
	var direction_to_mouse: Vector2 = angle_to_vector(global_position.direction_to(get_global_mouse_position()).angle())
	bullet_h.init(damage, direction_to_mouse)
	get_tree().root.add_child(bullet_h)
	pass

func angle_to_vector(angle: float) -> Vector2:
	return Vector2(cos(angle), sin(angle))
