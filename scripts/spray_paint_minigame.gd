extends Node2D

@export var spray_can_scene: PackedScene
@export var spawn_areas: Array[Area2D]  # Assign your 4 Area2Ds in the inspector

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("stomp"):
		#spawn_spray_can()
	pass
# Spawns a spray can in a random Area2D and applies rotation based on the selected area.
func spawn_spray_can() -> void:
	# Choose a random Area2D
	var random_index = randi() % spawn_areas.size()
	var random_area = spawn_areas[random_index]
	
	# Get the collision shape of the Area2D
	var collision_shape = random_area.get_node("CollisionShape2D").shape
	if collision_shape is RectangleShape2D:
		# Generate a random position within the rectangle
		var random_position = Vector2(
			randi_range(-collision_shape.size.x / 2, collision_shape.size.x / 2),
			randi_range(-collision_shape.size.y / 2, collision_shape.size.y / 2)
		)
		# Convert the local position to the global position
		random_position = random_area.global_position + random_position
		
		# Instance the spray can scene
		var spray_can = spray_can_scene.instantiate()
		if spray_can:
			spray_can.position = random_position
			# Rotate based on the area index
			match random_index:
				0:
					spray_can.rotation = deg_to_rad(randi_range(60,90))  # Area 1: Rotate 90 degrees
				1:
					spray_can.rotation = deg_to_rad(randi_range(240,300))   # Area 2: Rotate 270 degrees
				2:
					spray_can.rotation = deg_to_rad(randi_range(150,210))   # Area 2: Rotate 270 degrees
				3:
					spray_can.rotation = deg_to_rad(randi_range(-30,30))  # Area 4: No rotation
			add_child(spray_can)
