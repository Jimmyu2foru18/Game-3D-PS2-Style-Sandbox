extends EnemyState
class_name Alert

## Enemy AI state: Chase the player.

func physics_update(_delta: float) -> void:
	var player = get_tree().get_first_node_in_group("Player")
	if player:
		enemy.set_target_position(player.global_position)
		var direction = (enemy.nav_agent.get_next_path_position() - enemy.global_position).normalized()
		enemy.velocity.x = direction.x * enemy.speed * 1.5 # Faster when alerted
		enemy.velocity.z = direction.z * enemy.speed * 1.5
