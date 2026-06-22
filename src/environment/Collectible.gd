extends Area3D
class_name Collectible

## Base class for all world collectibles.

signal collected(id: String)

@export var id: String

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		collect()

func collect() -> void:
	collected.emit(id)
	queue_free()
