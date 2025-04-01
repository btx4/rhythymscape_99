extends Area2D

@export var amplitude_x: float = 5.0  # How far to move in the x direction
@export var amplitude_y: float = 5.0  # How far to move in the y direction
@export var frequency_x: float = 1.0   # Speed of oscillation in x
@export var frequency_y: float = 2.0   # Speed of oscillation in y



var time_passed: float = 0.0  # Keeps track of time for sine wave
var start_position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spawn_points = get_tree().get_nodes_in_group("flipper_spawn_points")
	
	if spawn_points.size() > 0:
		var random_spawn = spawn_points.pick_random()
		position = random_spawn.global_position
		if random_spawn.position.x < -50:
			rotation_degrees = 270
		elif random_spawn.position.x >50:
			rotation_degrees = 90
		elif random_spawn.position.y > 50:
			rotation_degrees = 180
		
	#print(spawn_points)
	var viewport_size = get_viewport_rect().size
	var half_width = viewport_size.x / 2
	var half_height = viewport_size.y / 2

	if position.x > half_width + 20:  # Right side
		rotation_degrees = 90
	elif position.y > half_height + 20:  # Bottom
		rotation_degrees = 180
	
	start_position = position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if scale.x > 1:
		scale = scale *.99
	time_passed += delta  # Accumulate time

	var new_x = amplitude_x * sin(time_passed * frequency_x)
	var new_y = amplitude_y * sin(time_passed * frequency_y)
	
	position = start_position + Vector2(new_x, new_y)
	pass



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("note"):
		area.index = area.index + 5
		area.position_change()
		area.rotated = true
		_on_trigger()
		
	pass # Replace with function body.

func _on_trigger():
	scale.x = 1.05
	scale.y = 1.2
