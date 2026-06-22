extends PlayerState

func physics_update(delta: float) -> void:
	var direction = (player.transform.basis * Vector3(player.input_dir.x, 0, player.input_dir.y)).normalized()
	
	player.velocity.x = direction.x * player.speed
	player.velocity.z = direction.z * player.speed
	player.move_and_slide()
	
	player.rotate_towards_direction(direction, delta)
	
	if player.is_on_floor():
		if player.input_dir.length() > 0.1:
			state_machine.transition_to("Run")
		else:
			state_machine.transition_to("Idle")
		return

	# Check for acrobat snap
	if Input.is_action_just_pressed("acrobat"):
		var anchor = player.acrobat_detector.get_best_anchor()
		if anchor:
			match anchor.type:
				AcrobatAnchor3D.Type.SPIRE:
					state_machine.transition_to("SpireSnap", {"anchor": anchor})
				AcrobatAnchor3D.Type.ROPE:
					state_machine.transition_to("RopeWalk", {"anchor": anchor})
				AcrobatAnchor3D.Type.POLE:
					state_machine.transition_to("PoleClimb", {"anchor": anchor})
