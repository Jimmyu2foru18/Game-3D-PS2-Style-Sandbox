extends StateMachine
class_name EnemyStateMachine

## State Machine for Enemy AI.

func _ready() -> void:
	await owner.ready
	# Initialize states (similar to PlayerStateMachine)
	for child in get_children():
		if child is EnemyState:
			child.state_machine = self
	if initial_state:
		state = initial_state
		state.enter()
