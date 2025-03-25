extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ($PointLight2D.visible == true && Input.is_action_just_pressed("stomp")):
		get_parent().get_node("PauseMenu").toggle_pause()


func _on_pause_hover_area_mouse_entered() -> void:
	$PointLight2D.visible = true

func _on_pause_hover_area_mouse_exited() -> void:
	$PointLight2D.visible = false
