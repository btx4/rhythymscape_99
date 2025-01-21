extends Area2D

var radius: float = 2.0  # Radius of the circle
var circular_speed: float = 1.0  # Speed of the circular motion
var angle: float = randf()  # Current angle in radians
var hit = false

var velocity: Vector2
var speed: float = 200.0
var fade_speed: float = 1.0  # Speed at which the sprite fades out

func _ready() -> void:
	var random_angle = randf_range(0, 2 * PI)
	
	velocity = Vector2(cos(random_angle), sin(random_angle)) * speed

func _process(delta: float) -> void:
	# Increment the angle based on speed and delta
	if hit == false:
		position.y += (sin(Time.get_unix_time_from_system())/10)
		angle += circular_speed * delta
		rotation = angle + PI / 2
	else:
		# Move the sprite in the random direction
		position += velocity * delta

		# Gradually lower opacity
		modulate.a -= fade_speed * delta
		if modulate.a <= 0:
			queue_free()  # Remove the node when fully transparent
		#send off into a a random direction
		#disable the CollisionShape2D
		#lower the opacity progressively


func _on_mouse_entered() -> void:
	var collision_shape = $CollisionShape2D
	if collision_shape:
		collision_shape.disabled = true
	hit = true
	pass # Replace with function body.
