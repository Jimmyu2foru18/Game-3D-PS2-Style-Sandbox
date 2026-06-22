extends SceneTree

## Minimal Test Runner for Unit Tests.

func _init() -> void:
	print("--- Running Raccoon Rogue Tests ---")
	
	var tests = [
		test_save_manager,
		test_event_bus
	]
	
	var success_count = 0
	for test in tests:
		if await test.call():
			success_count += 1
			
	print("--- Tests Finished: %d/%d Passed ---" % [success_count, tests.size()])
	quit(0 if success_count == tests.size() else 1)

func test_save_manager() -> bool:
	print("[Test] SaveManager...")
	# Add actual test logic here
	return true

func test_event_bus() -> bool:
	print("[Test] EventBus...")
	# Add actual test logic here
	return true
