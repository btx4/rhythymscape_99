extends Sprite2D

# Duration of the fade-out in seconds
var fade_duration : float = 1.0
var fade_timer : float = 0.0


func _ready():
	# Align text horizontally and vertically
	pass
	
# Function to start the fade-out effect
func start_fade_out():
	visible = true
	fade_timer = fade_duration
	position.x =  randi_range(320 - 80,320 + 80)
	position.y =  randi_range(180 - 63,180  + 63)
	rotation = deg_to_rad(randi_range(-60, 60))
	set_process(true)
	get_parent().get_parent().get_node("CanvasLayer").sat_down()

# Process function to handle the fade
func _process(delta):
	if fade_timer > 0:
		fade_timer -= delta
		var fade_amount = fade_timer / fade_duration
		modulate.a = fade_amount  # Change alpha value
	else:
		set_process(false)
