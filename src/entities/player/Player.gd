extends CharacterBody3D
class_name Player

## Main Player Controller for Remy Raccoon.

@export_group("Movement")
@export var speed: float = 7.0
@export var sprint_speed: float = 11.0
@export var jump_force: float = 12.0
@export var rotation_speed: float = 12.0
@export var gravity: float = 30.0

@export_group("Combat")
@export var equipped_gadget: Gadget

@onready var state_machine: StateMachine = $StateMachine
@onready var visual: Node3D = $Visual
@onready var acrobat_detector: AcrobatDetector3D = $AcrobatDetector3D

var input_dir: Vector2 = Vector2.ZERO
var move_direction: Vector3 = Vector3.ZERO

func _physics_process(delta: float) -> void:
	input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	
	# Basic gravity application if not on floor and not in an acrobat state
	# Some states might override this behavior.
	if not is_on_floor() and state_machine.state.name != "SpireSnap":
		velocity.y -= gravity * delta

func rotate_towards_direction(direction: Vector3, delta: float) -> void:
	if direction.length() > 0.1:
		var target_rotation = atan2(-direction.x, -direction.z)
		visual.rotation.y = lerp_angle(visual.rotation.y, target_rotation, rotation_speed * delta)

func is_sprinting() -> bool:
	return Input.is_action_pressed("sprint")
