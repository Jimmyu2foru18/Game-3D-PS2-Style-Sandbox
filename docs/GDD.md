# Game Design Document: Raccoon Rogue
*A 3D Cel-shaded Stealth-Action Platformer*

## 1. Overview & Core Pillars
**Raccoon Rogue** is a 3D stealth-action platformer built in Godot 4. Inspired by classic mascot platformers—specifically *Sly 2: Band of Thieves*—the game blends vertical rooftop traversal, systemic stealth mechanics, acrobatic movement, light melee combat, and heist-based mission loops within a stylized, cel-shaded cartoon world.

### Core Pillars
1. **The Joy of Traversal (Thief Acrobatics):** Movement is not just walking and jumping. It is climbing poles, sliding along ropes, running along narrow ledges, and snapping precisely onto spires (like light posts and chimneys) with rhythmic, satisfying button presses.
2. **Systemic Stealth (Shadows & Silences):** Players must navigate 3D environments by staying out of vision cones, avoiding noisy surfaces, hiding in containers, and pickpocketing guards from behind.
3. **The Heist Loop (Hub & Safehouse):** The game is structured around a central safehouse in a large, open city district. From here, players venture out to gather intel, steal keys, disable security, and eventually execute multi-stage heist missions.
4. **Cartoon Noir Aesthetics:** A cel-shaded, comic-book-inspired visual style with bold outlines, rich gradient lights, atmospheric jazz-fusion music, and a cast of stylized anthropomorphic animals.

---

## 2. Character & Narrative Setup
### Protagonist: Remy Raccoon
* **Background:** An agile thief from a long line of master infiltrators who only steal from corrupt billionaires and criminal syndicates.
* **Tool of Choice:** A signature brass-headed cane hook, used for traversal, combat, and pickpocketing.
* **Allies:**
  * **Jax (The Tech Badger):** Resides in the Safehouse, providing hacking support, new gadgets, and progression upgrades.
  * **Penny (The Muscle Hippo):** Coordinates brute-force distractions and heavy lifting during heist finales.

### Antagonist Faction: The Syndicate of Steel
Led by **Baron Von Boar**, a corrupt industrial tycoon who has acquired ancient blueprint pieces (The Codex of Infiltration) to build automated security networks across the city.
* **Enemy Types:**
  * **Watch-Dogs (Light Guards):** Patrol with flashlights. Susceptible to stealth takedowns.
  * **Enforcer Bulls (Heavy Guards):** Strong, front-facing armor. Cannot be taken down silently without a distraction; requires dodging and backstabs.
  * **Security Drones:** Patrol the skies, project red laser grids, and alert nearby guards.

---

## 3. Movement & Traversal Systems
Movement is physics-based but highly assisted by an **Acrobatic Interaction System** (triggered by pressing the **Acrobat Key** - default `Shift` or `Gamepad Face Button South`).

```
   [Free Jump]
        │
        ▼ (Press Acrobat Key near Anchor)
   [Magnet State] ───► Snapped to: Spire, Rope, Pole, or Ledge
        │
        ▼ (Jump Directionally)
   [Release & Jump]
```

### Basic Movement
* **Walk/Run:** Responsive, high-friction movement to prevent sliding off narrow rooftops.
* **Sprint:** Faster movement at the cost of generating high noise, alerting guards who hear the footsteps.
* **Crouch:** Lowers the player's profile, decreases detection rate, and suppresses footstep noise completely.

### Thief Acrobatics (Context-Sensitive)
* **Spire Jump:** Jumping near a narrow vertical point (fence post, antenna, spire) and pressing the Acrobat Key snaps Remy onto it in a perfect balance stance.
* **Rope Traversal / Tightrope walking:** Pressing the Acrobat Key near a horizontal rope snaps Remy to it, allowing him to run along it or hang underneath it.
* **Pole Climbing:** Snapping to vertical poles or pipes. Remy can climb up/down, rotate, and jump away.
* **Ledge Grab & Crawl:** Hanging onto walls or ledge lips, shimmying left/right, and climbing up.
* **Rail Slide / Grind:** Sliding along pipes or cables using the cane.
* **Double Jump:** A mid-air spin that extends jump distance.

---

## 4. Stealth & AI Detection System
Stealth relies on line-of-sight, noise generation, and environmental cover.

### Enemy AI States
1. **Idle / Patrol:** Following a predefined path. Flashlight beam is **Blue**.
2. **Suspicious:** Triggered by hearing a sound or briefly seeing the player. Guard halts, investigates the point of interest. Flashlight beam is **Yellow**.
3. **Searching:** Triggered if they find nothing at the interest point but remain alert. They search nearby bushes or hiding spots. Flashlight beam is **Orange**.
4. **Alerted / Combat:** Player is fully spotted. Guard blows a whistle, alerting nearby guards, and chases the player to attack. Flashlight beam is **Red**.

### Stealth Mechanics
* **Vision Cones:** Projected from enemy eyes. The detection meter fills based on distance, light level, and whether the player is crouching.
* **Sound Footprints:** Running or smashing crates creates a sound sphere. Guards inside the sphere enter the *Suspicious* state and investigate.
* **Hiding Spots:** Barrels, tables, and vents. Entering these breaks line of sight and halts detection, even if guards are nearby, as long as they didn't see you enter.
* **Stealth Takedown (Cane Slam):** Sneaking up directly behind an unaware guard and pressing the attack button triggers a silent, instant knockout animation.
* **Pickpocketing:** Guards have glowing coin pouches on their belts. Sneaking behind them and pressing the Interact key steals coins or heist items (keys, plans) without alerting them.

---

## 5. Combat & Gadgets
While stealth is preferred, Remy can defend himself.

### Cane Combat
* **Melee Combo:** A 3-hit strike chain (Sweep -> Spin -> Overhead Slam) that deals moderate damage and knocks back light guards.
* **Dodge Roll:** High-speed roll with brief invulnerability frames, crucial for escaping Heavy Guard swings.
* **Counter Strike:** Parrying a guard's attack right as they flash yellow, knocking them down and leaving them vulnerable.

### Gadget System
Remy can equip and hotkey up to 3 gadgets at a time, purchased and upgraded at the Safehouse:
1. **Smoke Bomb:** Drops a cloud that blinds enemies in a radius, allowing instant stealth takedowns or a clean escape.
2. **Distraction Decoy (Alarm Clock):** A wind-up toy thrown to emit loud noise, pulling guards away from their patrol routes.
3. **Paraglider:** Activated mid-air to slowly glide down from high rooftops, extending traversal range.
4. **EMP Dart:** Disables security cameras, laser gates, and drones temporarily.
5. **Grapple Hook:** Anchors to specialized metal rings to pull Remy up to otherwise unreachable heights.

---

## 6. Heist Loop & Progression
The game flows through a structured heist formula:

```
[Safehouse] ──► [Hub Exploration (Collectibles & Intel)] ──► [Job Missions (Key Theft, Sabotage)] 
     ▲                                                                     │
     └───────────────── [Safehouse Upgrades] ◄────────────── [Grand Heist Finale]
```

1. **Hub Exploration:** Explore a large cel-shaded urban district (e.g., Paris Canal District) to find hidden Clue Bottles, pickpocket guards for loot, and locate mission triggers.
2. **Jobs (Sub-Missions):** Small-scale missions launched from the hub:
   * Hacking security terminals.
   * Stealing blueprint codes from a moving train.
   * Planting trackers on patrol cars.
3. **The Safehouse:** Buy upgrades using stolen loot and coins. Customize gadgets, check clues, and choose active characters/missions.
4. **The Grand Heist (Heist Finale):** A multi-stage mission where Remy, Jax, and Penny collaborate. It involves disabling the main grid, breaching the vault, a boss encounter with a Syndicate leader, and an escape sequence.

---

## 7. Progression & Upgrades
* **Coins:** Gathered from pickpocketing, smashing crates, or completing jobs.
* **Clue Bottles:** Collectibles scattered in the hub. Collecting all bottles in a district unlocks a safe in the safehouse containing a permanent special ability (e.g., Water Skip, Thief Sense).
* **Jax's ThiefNet (Upgrade Store):**
  * *Smoke Bomb Upgrade:* Increases duration and blind radius.
  * *Fast Pickpocket:* Pickpocket guards instantly without holding down the button.
  * *Silent Steps:* Reduces sprint noise.
  * *Cane Charged Attack:* Hold attack button to unleash a shockwave sweep.
