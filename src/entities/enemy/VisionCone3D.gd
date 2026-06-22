extends Area3D
class_name VisionCone3D

## Vision cone detection system for enemies.

@onready var raycast: RayCast3D = $RayCast3D

var player_in_cone: Player = null

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _physics_process(_delta: float) -> void:
	if player_in_cone:
		if can_see_player(player_in_cone):
			EventBus.player_detected.emit(1.0) # Full alert

func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		player_in_cone = body

func _on_body_exited(body: Node3D) -> void:
	if body == player_in_cone:
		player_in_cone = null

func can_see_player(player: Player) -> bool:
	raycast.target_position = to_local(player.global_position)
	raycast.force_raycast_update()
	
	if raycast.is_colliding():
		return raycast.get_collider() == player
	return false
