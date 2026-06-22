extends Node

## Global Event Bus for decoupled communication.

# Player Signals
signal player_jumped
signal player_landed
signal player_detected(alert_level: float)
signal player_died

# Stealth/AI Signals
signal guard_alert_changed(guard: Node3D, new_state: int)
signal noise_generated(position: Vector3, magnitude: float)

# Game State Signals
signal mission_started(mission_id: String)
signal mission_completed(mission_id: String)
signal coin_collected(amount: int)
signal gadget_unlocked(gadget_id: String)

# UI Signals
signal request_pause
signal request_resume
