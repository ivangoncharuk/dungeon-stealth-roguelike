# Dungeon Stealth Roguelike

## Project Objective

The objective of this project is to develop a top-down 2D dungeon stealth game in the Godot Engine. The player will navigate a dark dungeon environment collecting keys scattered throughout the level. The dungeon will have patrolling enemies the player must avoid. The player must collect the keys to unlock the exit door and escape the level. The game will use dynamic 2D lighting and shadows as the central game mechanic. The player will possess a controllable light source to use for visibility but will also attract enemies. Enemies will react to the player's light and sound from player movements. The shadows cast by the environment provide opportunities for the player to hide.

## Project Description

This project will be developed using the Godot Engine v.4.4 and scripted using the GDScript language. The defining technical feature is the implementation and gameplay integration of real-time 2D dynamic lighting and shadows.

* Lighting: Player visibility will be managed via one or more `Light2D` nodes attached to the player character. This node projects light onto the scene, affecting visibility and interacting with occluders. Global ambiance will be controlled using `CanvasModulate` to ensure a dark, atmospheric base level of darkness.

* Shadows & Occlusion: Environmental elements, primarily defined within a `TileMap`, will serve as light occluders. The `TileSet` resource will be configured with occlusion layers, allowing walls and obstacles to realistically block light from `Light2D` sources and cast dynamic shadows. Standalone `StaticBody2D` or `Node2D` objects with `LightOccluder2D` children can also be used for more complex or dynamic obstacles.

* Rendering: Godot's 2D rendering pipeline will be used. I will utilize Godot's built-in shading language (based on GLSL ES 3.0) to implement custom visual effects, which will enhance the mood and gameplay. Examples include a vignette effect to enhance the feeling of limited vision, potential light flickering effects, or visual feedback for enemy alert states.

* AI: Enemy AI will utilize Godot's built-in features, potentially including `NavigationServer2D` for pathfinding on the `TileMap`, `Area2D` for vision cones/detection zones, and state machines for managing behaviors (patrolling, chasing, searching). Detection will primarily rely on line-of-sight checks within the light and potentially simple proximity/sound radius checks.

The end goal is a functional prototype that demonstrates the core game loop by the use of light and shadow, along with clear objectives and win/loss conditions.

## The Problem

The primary technical challenge in this project is the implementation and gamification of real-time 2D dynamic lighting and shadows. This involves:

The technical challenge and focus is the implementation of real-time 2D dynamic lighting and shadows, and gamifying it. This will involve:

1. Light Propagation: Simulating how light emanates from a source (`Light2D` node).
2. Occlusion: Determining which parts of the environment block light (`LightOccluder2D` data from `TileMap` or nodes).
3. Shadow Casting: Calculating and rendering the areas obscured from the light source by occluders.

The Godot Engine already handles the low-level rendering of this, but the problem being solved in the project is leveraging this visual system as the foundation for stealth gameplay.

* Visibility vs. Risk: Light is necessary to see, but also makes the player visible to enemies.
* Information Control: Light reveals the environment, objectives, and enemy positions, while shadows conceal them.
* Spatial Interaction: Shadows become tangible gameplay elements – safe zones the player can use strategically.
* Enemy Perception: Tying AI detection directly to the lighting system (enemies see the light, or see the player *within* the light).

Basically, it is taking a visual rendering feature and making it the central game mechanic for stealth, exploration, and risk assessment. While developing this, I will be play testing and tweaking the core mechanics so that the game is challenging but fun.

## Timeline

* Week 1:
	-  Project setup in Godot 4.4.
	-  Implement basic player character with top-down movement and input handling.
	-  Create initial `TileSet` with basic wall/floor tiles.
	-  Build a simple test `TileMap` layout.
	-  Add `Light2D` to the player and `CanvasModulate` for basic darkness.

* Week 2:
	-  Configure occlusion layers on the `TileSet`.
	-  Ensure walls correctly cast shadows from the player's light.
	-  Refine `Light2D` properties (texture, energy, range, shadow settings).
	-  Implement basic key collectible (`Area2D`) pickup logic (store count in a variable).
	-  Potential First Progress Check: Player movement, basic level, light/shadow casting, basic collectible interaction working.

* Week 3:
	-  Create the basic enemy scene (`CharacterBody2D`, sprite, collision).
	-  Implement simple enemy patrol behavior (e.g., moving between set `Marker2D` points or basic random wandering).

* Week 4:
	-  Add an `Area2D` to the enemy for a vision cone.
	-  Implement logic for the enemy to detect the player node when it enters the vision cone - and-  is sufficiently lit (basic check for now).
	-  Implement a simple "alerted" visual state change for the enemy (e.g., change sprite color).

* Week 5:
	-  Implement basic enemy chase behavior (move towards player's last known position upon detection).
	-  Implement the basic lose condition (e.g., collision with enemy during chase triggers game over).

* Week 6:
	-  Create the locked exit door scene (`StaticBody2D` or `Area2D`).
	-  Implement interaction logic: check if player has enough keys upon interaction.
	-  Implement the win condition (interacting with the unlocked door triggers win state).

* Onwards:
	-  Refinement of AI (making chase/detection more robust).
	-  Adding basic UI (key counter).
	-  Integrating placeholder sound effects.
	-  Exploring basic shaders (like vignette).
	-  Expanding the level design.
	-  Bug fixing and playtesting.
