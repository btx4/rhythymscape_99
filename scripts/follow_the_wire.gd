extends Node2D
var start_circle_target_beat
var end_circle_target_beat
var circle_color
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	circle_color = Color(1,1,1,1)
	
	$Start_circle.target_beat = start_circle_target_beat
	$Circle.target_beat = end_circle_target_beat
	$Circle.myColor = circle_color
	$Start_circle.myColor = circle_color
	
	#                                                 DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS
	"""
	$Circle.target_beat = 4
	$Circle.current_beat = 0
	$Start_circle.current_beat = 0
	$Start_circle.target_beat = 4
	
	position.x = randi_range(50,130)
	"""
	#  DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS DELETE THIS
	
	position.x = randi_range(150,330)
	position.y = randi_range(120,240)
	rotate(randf())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_wire_mouse_entered() -> void:
	print("Mouse is in")
	pass # Replace with function body.


func _on_wire_mouse_exited() -> void:
	print("Failed")
	if not is_instance_valid($Start_circle):  
		print("BOOGIDY")
	pass # Replace with function body.


func _on_circle_circle_popped(quality: int) -> void:
	
	queue_free()
	pass # Replace with function body.


func _on_circle_circle_not_popped() -> void:
	
	
	queue_free()
	pass # Replace with function body.

func _on_start_circle_circle_not_popped() -> void:
	pass # Replace with function body.


func _on_start_circle_circle_popped(quality: int) -> void:
	pass # Replace with function body.
