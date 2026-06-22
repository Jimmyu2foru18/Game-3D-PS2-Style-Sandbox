extends PlayerState

var current_anchor: AcrobatAnchor3D = null

func enter(msg: Dictionary = {}) -> void:
	if msg.has("anchor"):
		current_anchor = msg["anchor"]
		
	if current_anchor:
		# Disable collision temporarily or handle kinematically
		player.velocity = Vector3.ZERO
		
		# Snap position (In a real game, we'd tween this)
		player.global_position = current_anchor.get_snap_position()
		
		# Play landing sound
		# AudioManager.play_sfx(landing_sfx)

func physics_update(_delta: float) -> void:
	if not current_anchor:
		state_machine.transition_to("Air")
		return
		
	# Hold position
	player.global_position = current_anchor.get_snap_position()
	
	if Input.is_action_just_pressed("jump"):
		# Jump off the spire
		var jump_direction = (player.transform.basis * Vector3(player.input_dir.x, 0, player.input_dir.y)).normalized()
		if jump_direction.length() < 0.1:
			jump_direction = Vector3.UP
		else:
			jump_direction = (jump_direction + Vector3.UP).normalized()
			
		player.velocity = jump_direction * player.jump_force
		state_machine.transition_to("Air")
