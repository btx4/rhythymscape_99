extends Node2D

# Variables for screen shake
var shake_intensity: float = 0.0
var shake_duration: float = 0.0
var shake_timer: float = 0.0
var original_position: Vector2

func _ready():
	$Scene_Transition/AnimationPlayer.play("fade_in")
	ProjectSettings.set_setting("display/window/stretch/scale", 1)
	print(str(ProjectSettings.get_setting("display/window/stretch/scale")))
	#ProjectSettings.set("display/window/stretch/scale", 1)
	# Store the original position of the node
	original_position = position
	await get_tree().create_timer(0.5).timeout
	$"Music Conductor"._play_song()

func start_shake(intensity: float, duration: float):
	# Start the screen shake with specified intensity and duration
	shake_intensity = intensity
	shake_duration = duration
	shake_timer = duration

func _process(delta: float):
	
	if shake_timer > 0:
		# Apply random offset based on shake intensity
		position = original_position + Vector2(
			randf_range(-shake_intensity, shake_intensity),
			randf_range(-shake_intensity, shake_intensity)
		)
		
		# Decrease the shake timer
		shake_timer -= delta
		
		# End the shake when the timer runs out
		if shake_timer <= 0:
			shake_timer = 0
			position = original_position  # Reset position
	else:
		# Ensure position is reset when not shaking
		position = original_position
