extends State
class_name PlayerState

## Base class for player states to access the player node easily.

var player: Player

func _ready() -> void:
	await owner.ready
	player = owner as Player
