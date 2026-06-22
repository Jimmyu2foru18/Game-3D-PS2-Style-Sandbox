extends Node

## Manages game persistence and progression.

const SAVE_PATH = "user://savegame.json"

var current_data: Dictionary = {
	"coins": 0,
	"unlocked_gadgets": [],
	"completed_missions": [],
	"collected_bottles": {}, # Map of level_id to count
	"settings": {
		"master_volume": 1.0,
		"sfx_volume": 1.0,
		"music_volume": 1.0
	}
}

func _ready() -> void:
	load_game()

func save_game() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		var json_string = JSON.stringify(current_data)
		file.store_string(json_string)
		file.close()

func load_game() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
		
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file:
		var json_string = file.get_as_text()
		file.close()
		
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		if parse_result == OK:
			current_data = json.get_data()

func get_stat(key: String, default = null):
	return current_data.get(key, default)

func set_stat(key: String, value) -> void:
	current_data[key] = value
	save_game()
