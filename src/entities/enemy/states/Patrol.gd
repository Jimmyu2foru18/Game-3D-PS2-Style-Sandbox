extends EnemyState
class_name Patrol

## Enemy AI state: Patrol along predefined points.

var current_point_index: int = 0

func physics_update(_delta: float) -> void:
	if enemy.patrol_points.is_empty():
		return
		
	var target = enemy.patrol_points[current_point_index].global_position
	enemy.set_target_position(target)
	
	var direction = (enemy.nav_agent.get_next_path_position() - enemy.global_position).normalized()
	enemy.velocity.x = direction.x * enemy.speed
	enemy.velocity.z = direction.z * enemy.speed
	
	if enemy.nav_agent.is_navigation_finished():
		current_point_index = (current_point_index + 1) % enemy.patrol_points.size()
