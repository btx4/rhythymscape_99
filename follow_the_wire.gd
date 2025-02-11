extends Node2D
var start_circle_target_beat
var end_circle_target_beat
var circle_color
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Start_circle.target_beat = start_circle_target_beat
	$Circle.target_beat = end_circle_target_beat
	$Circle.myColor = circle_color
	$Start_circle.myColor = circle_color
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_wire_mouse_entered() -> void:
	print("Mouse is in")
	pass # Replace with function body.


func _on_wire_mouse_exited() -> void:
	print("Failes")
	if not is_instance_valid($Start_circle):  
		queue_free()
	pass # Replace with function body.
