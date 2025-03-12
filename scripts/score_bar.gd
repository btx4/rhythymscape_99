extends ProgressBar

func _ready() -> void:
	self.show_percentage = false
	EventScript.add_points.connect(_on_add_points)

func change_value(nValue: float):
	value = value + nValue
	pass

func _on_add_points(num_points: int):
	change_value(num_points)
