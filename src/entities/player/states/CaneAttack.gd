extends PlayerState
class_name CaneAttack

## Player state: 3-hit cane combo.

var combo_index: int = 0

func enter(_msg: Dictionary = {}) -> void:
	# Play attack animation based on combo_index
	print("Attacking: Hit ", combo_index + 1)
	
	# Perform hit detection
	# (In a real implementation, this would use Area3D or RayCast)
	
	combo_index = (combo_index + 1) % 3
	
	# Transition back to Idle after animation
	await get_tree().create_timer(0.5).timeout
	state_machine.transition_to("Idle")
