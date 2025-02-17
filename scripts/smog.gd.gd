extends Area2D

var radius: float = 2.0  # Radius of the circle
var circular_speed: float = 1.0  # Speed of the circular motion
var angle: float = randf()  # Current angle in radians
var hit = false

var velocity: Vector2
var speed: float = 50.0
var fade_speed: float = 1.0  # Speed at which the sprite fades out
var direction = Vector2(0,0)

func _ready() -> void:
	$Despawn_timer.start()
	var random_angle = randf_range(0, 2 * PI)
	velocity = Vector2(cos(random_angle), sin(random_angle)) * speed
	
func _process(delta: float) -> void:
	# Increment the angle based on speed and delta
	#angle += circular_speed * delta
	if hit == false:
		if speed > 0:
			position = position + direction * speed * delta
			speed = speed - 1
		elif speed < 0:
			position = position + direction * speed * delta
			speed = speed + 1
		
		#rotation = angle + PI / 2
	else:
		# Move the sprite in the random direction
		position += velocity * delta
		#rotation = angle + PI / 2
		# Gradually lower opacity
		modulate.a -= fade_speed * delta
		if modulate.a <= 0:
			queue_free()  # Remove the node when fully transparent
		#send off into a a random direction
		#disable the CollisionShape2D
		#lower the opacity progressively


func _on_mouse_entered() -> void:
	var collision_shape = $CollisionShape2D
	if collision_shape and not hit:
		#collision_shape.disabled = true
		pass
	hit = true
	pass # Replace with function body.


func _on_despawn_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.


func _on_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area:
		if area.is_in_group("destroy"):
			queue_free()
	pass # Replace with function body.
