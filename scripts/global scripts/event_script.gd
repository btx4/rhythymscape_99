extends Node
signal beat(beat_num: int)
signal measure(measure_num: int)
signal add_points(point_val: int)

var YELLOW = Color(1,0.961,0)
var RED = Color(0.91,0.176,0.514)
var GREEN = Color(0.412,0.973,0)
var BLUE = Color(0,0.729,0.996)

func report_beat(num_beat : int):
	print("Beat: " , num_beat)
	beat.emit(num_beat)

func report_points(num_points: int):
	print("oop")
	add_points.emit(num_points)  # Emit the correct signal
