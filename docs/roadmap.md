# Development Roadmap, Milestones & Risk Assessment: Raccoon Rogue

## 1. Development Roadmap (Phase-by-Phase)

### Phase 1: Project Setup & Core Infrastructure (Current)
* Initialize `project.godot` and project folder structure.
* Create core Singletons: `EventBus.gd`, `SaveManager.gd`, and `AudioManager.gd`.
* Build the base FSM classes (`StateMachine.gd`, `State.gd`).
* Establish the test runner structure (`tests/test_runner.gd`).

### Phase 2: Player Movement & Thief Acrobatics
* Implement Player Character Body and base Movement states (`Idle`, `Run`, `Sprint`, `Jump`, `Crouch`).
* Implement the context-sensitive `AcrobatAnchor3D` and `AcrobatDetector3D` classes.
* Implement Acrobat states: `SpireSnap` (balance landing on spires), `RopeWalk` (walking along lines), and `PoleClimb` (climbing vertical poles).
* Add Double Jump and Dodge Roll.

### Phase 3: Stealth Mechanics & Guard AI
* Build the visual vision cone (`SpotLight3D` + `Area3D`) and implement line-of-sight checking.
* Build the noise footprint mechanic (`NoiseSphere3D`).
* Implement the Guard AI FSM (`Patrol`, `Suspicious`, `Search`, `Alert`).
* Add Pickpocketing and silent Takedowns (Cane Slam).
* Integrate navigation mesh support (`NavigationAgent3D`).

### Phase 4: Melee Combat & Gadget Systems
* Implement Remy's 3-hit combo cane attack.
* Build the upgradable Gadget System framework (using `Gadget` Custom Resources).
* Create core gadgets: Smoke Bomb (AOE blind), Alarm Clock Decoy (sound distraction), and Paraglider (aerial gliding).
* Add progression logic (storing unlocked gadgets and coin expenditures).

### Phase 5: Hub City & Heist Mission Framework
* Build a modular whiteboxed city district (Paris Canal whitebox).
* Set up rooftop pathways (chimney runs, power-line walking).
* Create the Heist Mission Manager (story stages, clue bottle collectibles, safes).
* Implement the Safehouse hub interface.

### Phase 6: UI, Sound & Polish
* Implement Settings menu (graphics scaling, volume controls, key rebinding).
* Implement the in-game HUD (health, detection meter, gadget inventory, coin tracker).
* Apply visual cel-shaders and outlines.
* Crossfade audio channels between safehouse, hub exploration, and combat.

---

## 2. Milestone Breakdown

| Milestone | Deliverables | Target Objective |
| :--- | :--- | :--- |
| **M1: Core Engine** | Setup, Event Bus, State Machine bases, test runner. | A solid structural foundation. |
| **M2: Traversal MVP** | Jump, double-jump, crouch, spire snap, rope walk, pole climb. | "Feel of movement" matches original game loop. |
| **M3: Stealth MVP** | AI vision cone, noise propagation, stealth takedowns, pickpocket. | Fully playable stealth game loop. |
| **M4: Combat & Gear** | Cane attacks, smoke bomb, paraglider, decoy clock. | Full action vocabulary. |
| **M5: Job & Safehouse**| Hub exploration, clue bottles, safehouse shop, job manager. | Complete gameplay loop. |
| **M6: Visual & UI** | Cel-shaded material assets, menus, sound systems, HUD. | Feature-complete game build. |

---

## 3. Risk Assessment & Mitigations

### 1. Jittery Physics / Snapping Visuals (Acrobatics)
* **Risk:** Snapping the player to spires/ropes can cause visual stuttering or incorrect collision responses.
* **Mitigation:** Turn off character collisions during snapping. Use `Tween` nodes to smoothly transition the player's model position to the anchor's `snap_point` position, and switch state to a kinematically controlled `AcrobatState`.

### 2. High Computational Cost of Vision Cones
* **Risk:** Using Area3D detection triggers collision checks every frame, which degrades performance on lower-spec hardware (such as Steam Deck).
* **Mitigation:** Use Area3D detection *only* to check if the player's bounding box is in range. If yes, fire a single raycast directed at the player's center to check for occlusion, throttled to every 3-5 physics ticks.

### 3. State Machine Bloat
* **Risk:** The Player state machine could become bloated and difficult to maintain as new gadgets/moves are added.
* **Mitigation:** Maintain strict hierarchical state machines. Traversal states must be decoupled from combat states. Shared behaviors (like falling, taking damage) should be handles at the parent State Machine level.

### 4. Controller Mapping & Steam Deck Compatibility
* **Risk:** Complex controls (Stealth, jumping, acrobat snapping, gadgets, combat) might feel awkward on keyboard or default Steam Deck inputs.
* **Mitigation:** Integrate standard Godot `InputMap` actions with reasonable default bindings for both Xbox/DualShock style controllers and keyboard/mouse. Keep key action counts minimal (e.g. Combine "Acrobat Snap" and "Interact" into a single Context Key).
