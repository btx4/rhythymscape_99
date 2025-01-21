extends Node
signal beat(beat_num: int)
signal measure(measure_num: int)

func report_beat(num_beat : int):
	print("Beat: " , num_beat)
	beat.emit(num_beat)
