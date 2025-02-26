extends Node2D

@export var max_radius: float = 50.0  # The base maximum radius
@export var expansion_speed: float = 50.0  # Speed at which the radius initially grows
@export var pulse_amplitude: float = 2.0  # How much the radius changes during pulsing
@export var pulse_speed: float = 5.0  # How fast the radius pulses
@export var num_dashes: int = 20  # Number of dashes around the circle
@export var gap_ratio: float = 0.3  # Fraction of each segment dedicated to gaps
@export var line_color: Color = Color.WHITE
@export var rotation_speed: float = 0.5  # Speed in radians per second

var radius: float = 0.0  # Starts at 0 and grows to max_radius
var rotation_angle: float = 0.0
var time: float = 0.0  # Time tracker for sine wave pulsing
var done_expanding = false
var should_draw = true
func _ready() -> void:
	queue_redraw()

func _process(delta: float) -> void:
	# Expand the radius until it reaches max_radius
	if should_draw:
		if radius < max_radius and done_expanding == false:
			radius = min(radius + expansion_speed * delta, max_radius)
		else:
			done_expanding = true
			# Once max_radius is reached, oscillate with sine wave
			time += delta
			radius = max_radius + sin(time * pulse_speed) * pulse_amplitude
	else:
		radius = 0
	# Rotate the circle
	rotation_angle += rotation_speed * delta
	queue_redraw()

func _draw() -> void:
	if radius <= 0:
		return  # Skip drawing if the radius hasn't started growing

	var total_circumference = 2 * PI * radius
	var segment_length = total_circumference / num_dashes
	var gap_length = segment_length * gap_ratio
	var dash_length = segment_length - gap_length

	for i in range(num_dashes):
		var angle1 = rotation_angle + (i * segment_length / total_circumference) * TAU
		var angle2 = rotation_angle + ((i * segment_length + dash_length) / total_circumference) * TAU

		var start_point = Vector2(cos(angle1), sin(angle1)) * radius
		var end_point = Vector2(cos(angle2), sin(angle2)) * radius

		draw_line(start_point, end_point, line_color, 4.0)


func _on_break_radius_mouse_exited() -> void:
	pass # Replace with function body.
