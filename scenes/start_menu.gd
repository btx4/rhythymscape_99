extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ($QuitSprite2.visible == true) && Input.is_action_just_pressed("stomp"):
		print("quit -> exit game + restart intro looping animation")
		get_tree().change_scene_to_file("res://scenes/intro.tscn")
	if ($StartSprite2.visible == true) && Input.is_action_just_pressed("stomp"):
		print("start game -> nav to level menu")
		get_tree().change_scene_to_file("res://scenes/Levels/level_selector.tscn")
		


func _on_start_hover_area_mouse_entered() -> void:
	$StartSprite2.visible = true
	$StartHighlight.visible = true

func _on_quit_hover_area_mouse_entered() -> void:
	$QuitSprite2.visible = true
	$QuitHighlight.visible = true


func _on_start_hover_area_mouse_exited() -> void:
	$StartSprite2.visible = false
	$StartHighlight.visible = false

func _on_quit_hover_area_mouse_exited() -> void:
	$QuitSprite2.visible = false
	$QuitHighlight.visible = false
