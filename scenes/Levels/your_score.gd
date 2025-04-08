extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Scene_Transition/AnimationPlayer.play("fade_in")
	display_score()
	
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("stomp"):
		print("navigate to the main_menu")
		EventScript.total_points = 0
		print(EventScript.total_points)
		get_tree().change_scene_to_file("res://scenes/Levels/level_selector.tscn")
	
func display_score():
	$Score.text = str(EventScript.total_points)
