extends Gadget
class_name SmokeBomb

## Smoke bomb gadget implementation.

@export var blind_radius: float = 5.0
@export var blind_duration: float = 3.0

func use(user: Node3D) -> void:
	# Spawn a smoke cloud area
	var smoke_cloud = preload("res://src/gadgets/effects/SmokeCloud.tscn").instantiate()
	user.get_parent().add_child(smoke_cloud)
	smoke_cloud.global_position = user.global_position
	
	# Logic to blind nearby enemies would go here
	print("Smoke bomb used!")
