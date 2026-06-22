extends PlayerState

var current_anchor: AcrobatAnchor3D = null

func enter(msg: Dictionary = {}) -> void:
	if msg.has("anchor"):
		current_anchor = msg["anchor"]
		
	if current_anchor:
		player.velocity = Vector3.ZERO
		# Align player to pole center horizontally
		var snap_pos = current_anchor.global_position
		snap_pos.y = player.global_position.y
		player.global_position = snap_pos

func physics_update(delta: float) -> void:
	if not current_anchor:
		state_machine.transition_to("Air")
		return
		
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var climb_speed = player.speed * 0.7
	
	player.global_position.y += -input_dir.y * climb_speed * delta
	
	# Rotate player around pole? (Maybe later)
	
	if Input.is_action_just_pressed("jump"):
		# Jump away from pole
		var jump_dir = (player.global_position - current_anchor.global_position).normalized()
		jump_dir.y = 1.0
		player.velocity = jump_dir.normalized() * player.jump_force
		state_machine.transition_to("Air")
