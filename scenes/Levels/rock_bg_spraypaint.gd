extends Sprite2D
var degree_of_sat
var color = Color.from_hsv(0.9499, 0.74, 1.0, 0.8745)
var value = 1.0
var saturation = 0.74

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func sat_down():
	#print("okay it works")
	saturation = saturation - 0.1
	value = value - 0.1
	color.v = value
	color.s = saturation
	self.modulate = color
	if color.s <= 0.14:
		Color.from_hsv(0.9499, 0.74, 1.0, 0.8745)
		self.modulate = color
		if get_tree():
			get_tree().reload_current_scene()

func sat_up():
	saturation = saturation + 0.1
	value = value + 0.1
	if saturation > 0.74:
		saturation = 0.74
	if value > 1.0:
		value = 1.0
	color.s = saturation
	color.v = value
	self.modulate = color
