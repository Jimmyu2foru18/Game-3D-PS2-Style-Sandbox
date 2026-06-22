extends EnemyState
class_name Suspicious

## Enemy AI state: Investigate point of interest.

var interest_point: Vector3

func enter(msg: Dictionary = {}) -> void:
	if msg.has("point"):
		interest_point = msg["point"]
		enemy.set_target_position(interest_point)

func physics_update(_delta: float) -> void:
	if enemy.nav_agent.is_navigation_finished():
		# Look around (simplified: just wait)
		await get_tree().create_timer(2.0).timeout
		state_machine.transition_to("Patrol")
