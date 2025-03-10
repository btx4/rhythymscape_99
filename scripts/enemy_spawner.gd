extends Node2D

@export var enemy_basic_scene : PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemy_count = randi_range(3,4) # Generate count **before** the loop
	for i in range(enemy_count):  # Loop a fixed number of times
		var new_scene = enemy_basic_scene.instantiate()
		add_child(new_scene) # Use self instead of get_parent() unless needed
		position.x = get_parent().position.x +  randi_range(-5,5)
		position.y = get_parent().position.y +  randi_range(-5,5)
		print("Spawned Enemy")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
