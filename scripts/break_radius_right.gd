extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var bodies  = get_overlapping_areas()
	for body in bodies:
		print(bodies)
		if body.is_in_group("note"):
			print("DISABLED")
			body.disabled = true
	pass


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("note"):
		print("Disabled")
		area.disabled = true
	pass # Replace with function body.

func clear_notes():
	print("Called")
	var bodies  = get_overlapping_areas()
	for body in bodies:
		if body.is_in_group("note"):
			body.disabled = false
	get_parent().get_parent().get_parent().get_parent().get_parent().get_node("Pulsing_circle").red_hittable = true
	queue_free()
