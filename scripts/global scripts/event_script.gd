extends Node
signal beat(beat_num: int)
signal measure(measure_num: int)
var YELLOW = Color(1,1,0)
var RED = Color(1,0,0)
var GREEN = Color(0,1,0)
var BLUE = Color(0,0,1)

func report_beat(num_beat : int):
	print("Beat: " , num_beat)
	beat.emit(num_beat)
