extends PlayerState

var current_anchor: AcrobatAnchor3D = null

func enter(msg: Dictionary = {}) -> void:
	if msg.has("anchor"):
		current_anchor = msg["anchor"]
		
	if current_anchor:
		player.velocity = Vector3.ZERO
		# In a real implementation, we'd snap to the nearest point on the rope line.
		player.global_position = current_anchor.get_snap_position()

func physics_update(delta: float) -> void:
	if not current_anchor:
		state_machine.transition_to("Air")
		return
		
	# Movement along the rope (simplified as local Z movement for this prototype)
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var move_speed = player.speed * 0.5 # Slower on ropes
	
	# For a real rope, we'd calculate the rope direction vector.
	# Here we'll just move along the anchor's forward axis.
	var rope_dir = current_anchor.global_transform.basis.z.normalized()
	player.global_position += rope_dir * input_dir.y * move_speed * delta
	
	if Input.is_action_just_pressed("jump"):
		player.velocity = Vector3.UP * player.jump_force
		state_machine.transition_to("Air")
