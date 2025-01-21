extends Node2D

@export var instance_scene: PackedScene  # Drag and drop your scene in the Inspector
@export var spawn_count: int = 180  # Number of instances to spawn

func _ready() -> void:
	spawn_instances()

func spawn_instances() -> void:
	for i in range(spawn_count):
		var instance = instance_scene.instantiate()
		instance.position = Vector2(randi_range(0, 320), randi_range(0, 360))
		add_child(instance)
