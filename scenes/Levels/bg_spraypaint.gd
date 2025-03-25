extends Sprite2D
var degree_of_sat
var color = Color.from_hsv(0.3928, 0.63, 0.89, 1.0)
var value = 0.89
var saturation = 0.73

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func sat_down():
	#print("okay it works")
	saturation = saturation - 0.1
	color.s = saturation
	self.modulate = color
	if color.s <= 0.13:
		color = Color.from_hsv(0.3928, 0.63, 0.89, 1.0)
		self.modulate = color
		get_tree().reload_current_scene()

func sat_up():
	saturation = saturation + 0.1
	if saturation > 0.63:
		saturation = 0.63
	color.s = saturation
	self.modulate = color
