extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	if get_parent().get_parent().get_parent().get_node("Sprite2D/Start point/Wire_entry_point/Line drawer").should_draw_line == true:
		print("COMPLETE")
		get_parent().get_parent().get_parent().get_node("Sprite2D/Start point/Wire_entry_point/Line drawer").complete = true
		get_parent().get_parent().get_parent().get_node("Sprite2D/Start point/Wire_entry_point/Line drawer").should_draw_line = false
	pass # Replace with function body.
