extends CharacterBody3D
class_name Enemy

## Main Guard AI Controller.

@export var speed: float = 3.0
@export var patrol_points: Array[Node3D] = []

@onready var state_machine: EnemyStateMachine = $EnemyStateMachine
@onready var nav_agent: NavigationAgent3D = $NavigationAgent3D
@onready var vision_cone: Area3D = $VisionCone3D

var current_alert_level: float = 0.0

func _ready() -> void:
	# Navigation initialization
	nav_agent.path_desired_distance = 0.5
	nav_agent.target_desired_distance = 0.5

func _physics_process(delta: float) -> void:
	# Handle gravity
	if not is_on_floor():
		velocity.y -= 30.0 * delta
	
	move_and_slide()

func set_target_position(target: Vector3) -> void:
	nav_agent.target_position = target
