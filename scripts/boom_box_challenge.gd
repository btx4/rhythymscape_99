extends Node2D

@export var boom_box_scene: PackedScene
@export var spawn_areas: Array[Area2D]  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _spawn_boom_box():
	var random_index = randi() % spawn_areas.size()
	var random_area = spawn_areas[random_index]
	
	# Get the collision shape of the Area2D
	var collision_shape = random_area.get_node("CollisionShape2D").shape
	randomize()

	var random_position = Vector2(
		randi_range(-collision_shape.size.x / 2, collision_shape.size.x / 2),
		randi_range(-collision_shape.size.y / 2, collision_shape.size.y / 2)
	)
	print(random_position)
		# Convert the local position to the global position
	random_position = random_area.global_position + random_position
	
	# Instance the spray can scene
	var boom_box = boom_box_scene.instantiate()
	boom_box.position = random_position
	add_child(boom_box)


func _on_timer_timeout() -> void:
	#_spawn_boom_box()
	pass # Replace with function body.
