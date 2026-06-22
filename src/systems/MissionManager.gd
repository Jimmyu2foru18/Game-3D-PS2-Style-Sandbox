extends Node
class_name MissionManager

## Manages mission states and collectible progression.

enum MissionState { LOCKED, ACTIVE, COMPLETED }

var missions: Dictionary = {}
var clue_bottles_collected: int = 0

func _ready() -> void:
	EventBus.mission_started.connect(_on_mission_started)
	EventBus.mission_completed.connect(_on_mission_completed)
	EventBus.coin_collected.connect(_on_coin_collected)

func _on_mission_started(mission_id: String) -> void:
	missions[mission_id] = MissionState.ACTIVE
	SaveManager.set_stat("missions", missions)

func _on_mission_completed(mission_id: String) -> void:
	missions[mission_id] = MissionState.COMPLETED
	SaveManager.set_stat("missions", missions)

func _on_coin_collected(amount: int) -> void:
	var current_coins = SaveManager.get_stat("coins", 0)
	SaveManager.set_stat("coins", current_coins + amount)

func get_mission_state(mission_id: String) -> MissionState:
	return missions.get(mission_id, MissionState.LOCKED)
