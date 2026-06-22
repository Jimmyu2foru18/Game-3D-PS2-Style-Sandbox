extends Area3D
class_name AcrobatAnchor3D

enum Type { SPIRE, ROPE, POLE, LEDGE }

@export var type: Type = Type.SPIRE
@export var snap_point_offset: Vector3 = Vector3.ZERO
@export var exit_velocity_multiplier: float = 1.0

func get_snap_position() -> Vector3:
	return global_position + snap_point_offset
