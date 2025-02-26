extends Node2D

var mouse_position: Vector2
var should_draw_line: bool = false  # Renamed to avoid conflict with the draw_line method
var complete = false
var stroke = 8.5
func _process(delta: float) -> void:
	queue_redraw()  # Ensure the line updates
var start
func _draw() -> void:
	if should_draw_line:
		start = get_parent().get_node("Everything_but_draw/Sprite2D/Start point").global_position
		mouse_position = get_local_mouse_position()  # Get mouse position globally
		get_parent().get_node("Everything_but_draw/Sprite2D/Start point/Electricity").global_position = mouse_position
		draw_line(start, mouse_position, Color.WHITE, stroke)  # Calls the correct function now
	
	if complete:
		should_draw_line = false
		get_parent().get_node("Everything_but_draw/Sprite2D2/End point").should_draw = false
		var end_position = get_parent().get_node("Everything_but_draw/Sprite2D2/End point").global_position
		get_parent().get_node("Everything_but_draw/Sprite2D/Start point/Electricity").emitting = false
		get_parent().get_node("Everything_but_draw/Sprite2D2/End point/Electricity").emitting = false
		draw_line(start, end_position, Color.WHITE, stroke)  # Calls the correct function now


func _on_wire_entry_point_mouse_entered() -> void:
	if complete == false:
		get_parent().get_node("Everything_but_draw/Sprite2D/Start point").should_draw = false
		should_draw_line = true
		queue_redraw()  # Request a redraw
	pass # Replace with function body.


func _on_wire_end_point_mouse_entered() -> void:
	if should_draw_line:
		complete = true
	pass # Replace with function body.


func _on_break_radius_mouse_exited() -> void:
	should_draw_line = false
	
	get_parent().get_node("Everything_but_draw/Sprite2D/Start point/Electricity").position = Vector2(5,0)
	pass # Replace with function body.
