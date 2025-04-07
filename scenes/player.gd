extends CharacterBody2D

# Exporting allows you to change this value in the Godot Editor's Inspector
@export var speed: float = 200.0

func _physics_process(delta: float) -> void:
	var input_direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction.normalized() * speed
	move_and_slide()
	# Optional: Stop moving instantly when input stops (otherwise it might slide a bit)
	# If you want momentum, you might handle velocity differently (e.g., using lerp for acceleration/deceleration)
	if input_direction == Vector2.ZERO:
		velocity = Vector2.ZERO
