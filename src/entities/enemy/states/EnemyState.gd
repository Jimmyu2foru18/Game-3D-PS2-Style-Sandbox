extends State
class_name EnemyState

## Base class for all Enemy states.

var enemy: Enemy

func _ready() -> void:
	await owner.ready
	enemy = owner as Enemy
