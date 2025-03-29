extends Sprite2D
var degree_of_sat
var color = Color.from_hsv(0.1274, 0.75, 0.91, 1.0)
var value = 0.91
var saturation = 0.75

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func sat_down():
	print("okay it works")
	value = value - 0.08
	saturation = saturation - 0.126
	color.v = value
	color.s = saturation
	self.modulate = color
	if color.v <= 0.51:
		color = Color.from_hsv(0.1274, 0.75, 0.91, 1.0)
		self.modulate = color
		if get_tree():
			get_tree().reload_current_scene()

func sat_up():
	print("MOVING UP IN THE WORLD")
	saturation = saturation + 0.126
	value = value + 0.08
	if saturation > 0.75:
		saturation = 0.75
	if value > 0.91:
		value = 0.91
	color.v = value
	color.s = saturation
	self.modulate = color
