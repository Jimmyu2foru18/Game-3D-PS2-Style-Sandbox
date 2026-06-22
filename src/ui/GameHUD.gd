extends Control
class_name GameHUD

## In-game HUD to display player stats.

@onready var coin_label: Label = $CoinLabel

func _ready() -> void:
	EventBus.coin_collected.connect(_on_coin_collected)
	update_ui()

func update_ui() -> void:
	coin_label.text = "Coins: " + str(SaveManager.get_stat("coins", 0))

func _on_coin_collected(_amount: int) -> void:
	update_ui()
