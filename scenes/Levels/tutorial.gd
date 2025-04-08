extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Scene_Transition/AnimationPlayer.play("fade_in")
	$GuitarTutorial.visible = false
	$StompTutorial.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("stomp") && ($GuitarTutorial.visible == false):
		$GuitarTutorial.visible = true
		$StompTutorial.visible = false
	elif Input.is_action_just_pressed("stomp") && ($GuitarTutorial.visible == true):
		print("navigating to level menu: tutorial complete")
		get_tree().change_scene_to_file("res://scenes/Levels/loading.tscn")
		
