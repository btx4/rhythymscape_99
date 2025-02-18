extends Node2D

@export var poppable_circle: PackedScene
@export var spawn_width: float = 100.0  # Width of the wave pattern
@export var spawn_delay: float = 0.03  # Delay in seconds
@export var max_y: float = 180.0  # Maximum Y position
var x_start_position = 160
var y_start_position = 20
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Spawns 20 circles in a wave pattern from top to bottom
func spawn_circles() -> void:
	for i in range(30):
		await get_tree().create_timer(spawn_delay).timeout  # Wait before spawning each circle
		var x_offset = sin(i * 0.5) * spawn_width  # Wave pattern using sine function
		var y_position = (i / 20.0) * max_y  # Spread circles from top to bottom
		spawn_circle(Vector2(position.x + x_offset + x_start_position, y_position + y_start_position))

# Spawns a single circle at a given position
func spawn_circle(spawn_position: Vector2) -> void:
	if poppable_circle:
		var circle_instance = poppable_circle.instantiate() as Node2D
		circle_instance.position = spawn_position
		add_child(circle_instance)
