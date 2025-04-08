extends Node2D
var scene_to_load = "res://scenes/Levels/level_selector.tscn"

func _ready() -> void:
	$Scene_Transition/AnimationPlayer.play("fade_in")
	ResourceLoader.load_threaded_request(scene_to_load)
	
	
func _process(delta: float) -> void:
	if ResourceLoader.load_threaded_get_status(scene_to_load) == ResourceLoader.THREAD_LOAD_LOADED:
		get_tree().change_scene_to_file(scene_to_load)
