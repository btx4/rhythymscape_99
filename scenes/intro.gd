extends Node2D
#how to say on game start-up link here first

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $LoopingANimation.is_playing() && Input.is_action_just_pressed("stomp"):
		print("nagivate to start menu")
		get_tree().change_scene_to_file("res://scenes/start_menu.tscn")


func _on_intro_animation_finished() -> void:
	$LoopingANimation.play()
