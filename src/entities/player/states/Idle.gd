extends PlayerState

func enter(_msg: Dictionary = {}) -> void:
	player.velocity.x = 0
	player.velocity.z = 0

func physics_update(_delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		return
		
	if player.input_dir.length() > 0.1:
		state_machine.transition_to("Run")
		return
		
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Jump")
		return
		
	player.move_and_slide()
