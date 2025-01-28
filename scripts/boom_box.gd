extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Create a Tween node dynamically
	rotate_r()
	

func rotate_r():
	# Create a new Tween node
	var tween2 = get_tree().create_tween()
	
	# Rotate the node 60 degrees to the right over 0.5 seconds
	tween2.tween_property(self, "rotation", deg_to_rad(30), 0.75)
	tween2.set_ease(Tween.EASE_OUT)
	
	# Connect the 'finished' signal of the tween to call 'rotate_l' when the rotation completes
	tween2.finished.connect(_on_rotate_r_finished)

# Signal handler that is called when the right rotation is finished
func _on_rotate_r_finished():
	rotate_l()  # Call rotate_l after rotate_r is finished

func rotate_l():
	# Create a new Tween node
	var tween2 = get_tree().create_tween()
	
	# Rotate the node 60 degrees to the left over 0.5 seconds
	tween2.tween_property(self, "rotation", deg_to_rad(-30), 0.75)
	tween2.set_ease(Tween.EASE_OUT)
	# Connect the 'finished' signal of the tween to call 'rotate_r' when the rotation completes
	tween2.finished.connect(_on_rotate_l_finished)

# Signal handler that is called when the left rotation is finished
func _on_rotate_l_finished():
	rotate_r()  # Call rotate_r after rotate_l is finished

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_timer_timeout() -> void:
	# Create a Tween node
	var tween = get_tree().create_tween()
	
	# Animate the 'modulate.a' property to lower the opacity to 0 over 1 second
	tween.tween_property(self, "modulate:a", 0.0, 1.0)  # 0.0 will set opacity to 0 over 1 second

	# Connect the Tween's 'finished' signal to free the node after the animation
	tween.finished.connect(_on_tween_finished)
# Signal handler to clean up the node when the tween finishes
func _on_tween_finished() -> void:
	queue_free()  # Frees the node after the animation completes
