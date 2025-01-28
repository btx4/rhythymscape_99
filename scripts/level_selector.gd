extends Node2D

@export var beat_it : PackedScene
@export var lacrimosa_requiem : PackedScene
@export var take_five : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_beat_it_pressed() -> void:
	if beat_it:
		# Instance the new scene
		var scene_instance = beat_it.instantiate()

		# Replace the current scene
		var current_scene = get_tree().get_current_scene()
		if current_scene:
			current_scene.queue_free()  # Free the current scene

		get_tree().root.add_child(scene_instance)  # Add the new scene to the root
		get_tree().set_current_scene(scene_instance)  # Set it as the current scene
	else:
		print("PackedScene is not set!")


func _on_lacrimosa_requiem_pressed() -> void:
	if lacrimosa_requiem:
		# Instance the new scene
		var scene_instance = lacrimosa_requiem.instantiate()

		# Replace the current scene
		var current_scene = get_tree().get_current_scene()
		if current_scene:
			current_scene.queue_free()  # Free the current scene

		get_tree().root.add_child(scene_instance)  # Add the new scene to the root
		get_tree().set_current_scene(scene_instance)  # Set it as the current scene
	else:
		print("PackedScene is not set!")


func _on_take_5_pressed() -> void:
	if take_five:
		# Instance the new scene
		var scene_instance = take_five.instantiate()

		# Replace the current scene
		var current_scene = get_tree().get_current_scene()
		if current_scene:
			current_scene.queue_free()  # Free the current scene

		get_tree().root.add_child(scene_instance)  # Add the new scene to the root
		get_tree().set_current_scene(scene_instance)  # Set it as the current scene
	else:
		print("PackedScene is not set!")
	pass # Replace with function body.


func _on_beat_it_button_4_pressed() -> void:
	if take_five:
		# Instance the new scene
		var scene_instance = take_five.instantiate()

		# Replace the current scene
		var current_scene = get_tree().get_current_scene()
		if current_scene:
			current_scene.queue_free()  # Free the current scene

		get_tree().root.add_child(scene_instance)  # Add the new scene to the root
		get_tree().set_current_scene(scene_instance)  # Set it as the current scene
	else:
		print("PackedScene is not set!")
	pass # Replace with function body.
