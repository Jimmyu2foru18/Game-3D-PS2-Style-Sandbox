# Raccoon Rogue

**Raccoon Rogue** is a 3D cel-shaded stealth-action platformer built in **Godot 4**. Inspired by classic heist platformers, the game features vertical rooftop traversal, systemic stealth mechanics, acrobatic movement, and a mission-based heist loop.

---

## 🏗️ Architectural Overview
This project utilizes a modular, component-based architecture for scalability and maintainability:

*   **Global Event Bus (`EventBus.gd`):** Decoupled communication between gameplay systems, UI, and audio.
*   **Finite State Machines (FSM):** Player and Enemy AI logic are driven by modular FSMs for clean state transitions.
*   **Data-Driven Gadget System:** Gadgets are defined as Godot `Resource` objects, allowing designers to create and balance new gadgets without altering core code.
*   **Persistence (`SaveManager.gd`):** JSON-based save system tracking progression, coins, and settings.

---

## ✨ Core Features

### Traversal & Acrobatics
*   **Context-Sensitive Movement:** Physics-based traversal with auto-snapping to environmental anchors.
*   **Acrobatic States:** Supports Spires (balance), Ropes (slide), Poles (climb), and Ledges (hang/shimmy).

### Stealth & AI
*   **Vision Cone Detection:** Area3D-based detection with line-of-sight (RayCast) validation.
*   **Alert States:** FSM-based AI with `Patrol`, `Suspicious`, and `Alert` (chase) behaviors.

### Combat & Gadgets
*   **Melee:** 3-hit cane combo system.
*   **Gadgets:** Extendable system (Example: `SmokeBomb` implemented) with cooldowns.

### Hub & Mission Loop
*   **MissionManager:** Tracks story progression and mission status.
*   **Collectibles:** Extendable `Collectible` base class (Example: `ClueBottle` implemented).

---

## 🛠️ Project Structure
```
src/
├── autoload/        # Singletons (EventBus, SaveManager, AudioManager, MissionManager)
├── core/            # Base FSM classes and Main entry
├── entities/        # Player and Enemy controllers + States
├── environment/     # Traversal anchors and Collectibles
├── gadgets/         # Gadget Resources and logic
├── ui/              # HUD and Pause Menu
└── systems/         # Global gameplay systems
```

---

## 🚀 Getting Started

1.  **Clone/Open:** Open the project folder in **Godot 4.3+**.
2.  **Input Map:** Ensure the following actions are mapped in `Project > Project Settings > Input Map`:
    *   `move_left`, `move_right`, `move_forward`, `move_back`
    *   `jump`, `sprint`, `acrobat`
    *   `attack`, `use_gadget`
    *   `request_pause`
3.  **Run:** Launch the project via `res://src/core/Main.tscn`.

---

## 🗺️ Roadmap Status
- ✅ **Phase 1: Core Engine** (Structure, AutoLoads, Base FSM)
- ✅ **Phase 2: Traversal MVP** (Acrobatics, Player States)
- ✅ **Phase 3: Stealth MVP** (Guard AI, Vision Cones)
- ✅ **Phase 4: Combat & Gear** (Cane Combo, Gadget Framework)
- ✅ **Phase 5: Job & Safehouse** (Mission/Collectible Management)
- ✅ **Phase 6: Visual & UI** (HUD, Pause Menu)

---

## 📝 Coding Standards
*   **Indentation:** Always use tabs.
*   **Typing:** Use explicit static typing for variables, parameters, and return types.
*   **Design:** Favor composition over inheritance; decouple using signals.
