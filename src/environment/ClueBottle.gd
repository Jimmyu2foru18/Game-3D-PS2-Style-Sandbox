extends Collectible
class_name ClueBottle

## Collectible clue bottle for district progression.

func collect() -> void:
	# Update clue bottle count in MissionManager
	# Assuming MissionManager has a way to increment this.
	# For now, let's just emit the signal and handle it elsewhere or add logic.
	
	# Actually, let's just make it call a method directly for simplicity if it's a global manager.
	# Or, use EventBus.
	
	EventBus.coin_collected.emit(10) # Placeholder: Clue bottles give coins?
	
	super.collect()
