extends Sprite2D
var degree_of_sat
var color = Color.from_hsv(0.6741, 0.87, 1.0, 1.0)
var opacity = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func sat_down():
	print("okay it works")
	opacity = opacity - 0.2
	color.a = opacity
	self.modulate = color
	if color.a <= 0.0:
		var color = Color.from_hsv(0.6741, 0.87, 1.0, 1.0)
		self.modulate = color
		if get_tree():
			get_tree().reload_current_scene()

func sat_up():
	print("MOVING UP IN THE WORLD")
	opacity = opacity + 0.2
	if opacity > 1.0:
		opacity = 1.0
	color.a = opacity
	self.modulate = color
