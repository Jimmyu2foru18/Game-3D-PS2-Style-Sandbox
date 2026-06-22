extends Resource
class_name Gadget

## Base class for all usable gadgets.

@export var name: String = "Gadget"
@export var cooldown: float = 1.0

func use(user: Node3D) -> void:
	pass
