extends Node2D

@export var poppable_circle: PackedScene
@export var spawn_radius: float = 120.0
@export var spawn_delay: float = 0.02  # Delay in seconds
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func spawn_circles() -> void:
	for i in range(10):
		await get_tree().create_timer(spawn_delay).timeout 
		var angle = (i / 10.0) * TAU  
		var position_offset = Vector2(cos(angle), sin(angle)) * spawn_radius
		spawn_circle(position + position_offset)

# Spawns a single circle at a given positions
func spawn_circle(spawn_position: Vector2) -> void:
	if poppable_circle:
		var circle_instance = poppable_circle.instantiate() as Node2D
		circle_instance.position = spawn_position
		add_child(circle_instance)
