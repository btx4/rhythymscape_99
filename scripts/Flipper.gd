extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spawn_points = get_tree().get_nodes_in_group("flipper_spawn_points")
	
	if spawn_points.size() > 0:
		var random_spawn = spawn_points.pick_random()
		position = random_spawn.global_position
		for point in spawn_points:
			print(point.position)
		if random_spawn.position.x < -50:
			rotation_degrees = 270
		elif random_spawn.position.x >50:
			rotation_degrees = 90
		elif random_spawn.position.y > 50:
			rotation_degrees = 180
		
	print(spawn_points)
	var viewport_size = get_viewport_rect().size
	var half_width = viewport_size.x / 2
	var half_height = viewport_size.y / 2

	if position.x > half_width + 20:  # Right side
		rotation_degrees = 90
	elif position.y > half_height + 20:  # Bottom
		rotation_degrees = 180
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("note"):
		area.index = area.index + 5
		area.position_change()
		area.rotated = true
	pass # Replace with function body.
