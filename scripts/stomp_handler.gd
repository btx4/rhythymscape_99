extends Node2D
var stompable = false
var color = Color(1,1,1)
@export var beatTime = 0.4317

var stomp_window_start
var stomp_window_actual
var stomp_window_difference

var isYellow = false
var isRed = false
var isGreen = false
var isBlue = false

var quality
var target_difference = 350
var thresh_perf = 25
var thresh_great = 50
var thresh_good = 100
var thresh_ok = 1000
var hitit = false
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("red") and isRed:
		hitit = true
	if event.is_action_pressed("yellow") and isYellow:
		hitit = true
	if event.is_action_pressed("green") and isGreen:
		hitit = true
	if event.is_action_pressed("blue") and isBlue:
		hitit = true
	if hitit:
		stomp_window_actual = Time.get_ticks_msec()
		stomp_window_difference = stomp_window_actual - stomp_window_start
		print("diff is" + str(stomp_window_difference))
		if stomp_window_difference < target_difference + thresh_perf and stomp_window_difference > target_difference - thresh_perf:
			print("Perfect")
			quality = 3
		elif stomp_window_difference < target_difference + thresh_great and stomp_window_difference > target_difference - thresh_great:
			print("Great!")
			quality = 2
		elif stomp_window_difference < target_difference + thresh_good and stomp_window_difference > target_difference - thresh_good:
			print("Good")
			quality = 1
		else:
			print("Ok...")
			quality = 0
	
		#emit_signal("circle_popped", quality)
		#queue_free()
		
		pass
	if event.is_action_pressed("yellow") and isYellow:
		stomp_window_actual = Time.get_ticks_msec()
		stomp_window_difference = stomp_window_actual - stomp_window_start
		print("diff is" + str(stomp_window_difference))
		pass
	if event.is_action_pressed("green")and isGreen:
		stomp_window_actual = Time.get_ticks_msec()
		stomp_window_difference = stomp_window_actual - stomp_window_start
		print("diff is" + str(stomp_window_difference))
		pass
	if event.is_action_pressed("blue") and isBlue:
		stomp_window_actual = Time.get_ticks_msec()
		stomp_window_difference = stomp_window_actual - stomp_window_start
		print("diff is" + str(stomp_window_difference))
		pass

func stompShit(type: Color):
	stomp_window_start = Time.get_ticks_msec()
	isRed = false
	isYellow = false
	isGreen = false
	isBlue = false
	
	match type:
		Color(1, 1, 0):  
			#print("Yellow detected!")
			isYellow = true
		Color(1, 0, 0):  
			#print("Red detected!")
			isRed = true
		Color(0, 1 ,0):
			#print("Green Detected")
			isGreen = true
		Color(0, 0 ,1):
			#print("Blue Detected")
			isBlue = true
		_:
			print("What!")
	stompable = true
	$FailCase.start(beatTime)

func _on_fail_case_timeout() -> void:
	stompable = false
	
	isRed = false
	isYellow = false
	isGreen = false
	isBlue = false
	pass # Replace with function body.
