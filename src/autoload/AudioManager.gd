extends Node

## Manages music and SFX with crossfading support.

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()
@onready var sfx_pool: Node = Node.new()

func _ready() -> void:
	add_child(music_player)
	music_player.bus = &"Music"
	
	sfx_pool.name = "SFXPool"
	add_child(sfx_pool)

func play_music(stream: AudioStream, fade_time: float = 1.0) -> void:
	if music_player.stream == stream:
		return
		
	if music_player.playing:
		var tween = create_tween()
		tween.tween_property(music_player, "volume_db", -80, fade_time)
		tween.tween_callback(func(): 
			music_player.stream = stream
			music_player.volume_db = 0
			music_player.play()
		)
	else:
		music_player.stream = stream
		music_player.volume_db = 0
		music_player.play()

func play_sfx(stream: AudioStream, position: Vector3 = Vector3.ZERO) -> void:
	var player: AudioStreamPlayer3D = AudioStreamPlayer3D.new()
	player.stream = stream
	player.bus = &"SFX"
	player.position = position
	sfx_pool.add_child(player)
	player.play()
	player.finished.connect(func(): player.queue_free())
