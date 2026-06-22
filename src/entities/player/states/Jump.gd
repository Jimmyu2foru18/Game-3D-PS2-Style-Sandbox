extends PlayerState

func enter(_msg: Dictionary = {}) -> void:
	player.velocity.y = player.jump_force

func physics_update(delta: float) -> void:
	var direction = (player.transform.basis * Vector3(player.input_dir.x, 0, player.input_dir.y)).normalized()
	
	player.velocity.x = direction.x * player.speed
	player.velocity.z = direction.z * player.speed
	player.move_and_slide()
	
	player.rotate_towards_direction(direction, delta)
	
	if player.velocity.y <= 0:
		state_machine.transition_to("Air")
