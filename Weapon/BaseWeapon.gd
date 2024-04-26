extends Node2D

class_name Weapon

## Magazine size of the gun.
@export var mag_size: int = 8
## Damage of the gun, divided by pellets if the gun is firing pellets (e.g shotguns)
@export var damage: float = 12.0
## Reload time in seconds for the gun. For shotgun-like guns, it's the time it takes for each pellet.
@export var reload_time: float = 3.0
## Fire cooldown between shots in seconds. For automatic guns, sets the time between each shot.
@export var fire_cd: float = 1.0

var m_CurAmmo: int = 0
var m_AudioPlayers: Array[AudioStreamPlayer] = []

func play_audio(audioFile: AudioStream) -> void:
	var audioPlayer = AudioStreamPlayer.new()
	audioPlayer.stream = audioFile
	m_AudioPlayers.push_back(audioPlayer)
	get_tree().root.add_child(audioPlayer)
	audioPlayer.finished.connect(Callable(destroy_player))
	audioPlayer.play()
	pass

func destroy_player() -> void:
	m_AudioPlayers.pop_front().queue_free()
	pass
