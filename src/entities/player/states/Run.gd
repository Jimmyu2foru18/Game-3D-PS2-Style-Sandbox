extends PlayerState

func physics_update(delta: float) -> void:
	var direction = (player.transform.basis * Vector3(player.input_dir.x, 0, player.input_dir.y)).normalized()
	
	if direction.length() < 0.1:
		state_machine.transition_to("Idle")
		return
		
	var current_speed = player.sprint_speed if player.is_sprinting() else player.speed
	
	player.velocity.x = direction.x * current_speed
	player.velocity.z = direction.z * current_speed
	player.move_and_slide()
	
	player.rotate_towards_direction(direction, delta)
	
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Jump")
		return
	
	if not player.is_on_floor():
		state_machine.transition_to("Air")
