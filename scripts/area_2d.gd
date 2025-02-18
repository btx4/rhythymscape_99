extends Area2D
var poppable = false
var type 
var current_beat = 0
var mouse_in = false

var LARGE_RADIUS = 1.2
var YELLOW = Color(1,1,0)
var RED = Color(1,0,0)
var GREEN = Color(0,1,0)
var BLUE = Color(0,0,1)
var WHITE = Color(1,1,1)

var myColor = Color(1,1,1)

@export var sec_per_beat = 0.4317 
@export var target_beat = 0

var popped = false
var one_pressed = false
var two_pressed = false
var three_pressed = false
var four_pressed = false

signal circle_popped(quality: int)
signal circle_not_popped

var difference
var start_time
var target_time
var pop_time

var perfect_threshold = 50
var great_threshold = 100
var good_threshold = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventScript.beat.connect(beat_listener)
	"""
	type = randi()%4 + 1
	#print(type)
	match type:
		1:
			$Sprite2D.modulate = YELLOW
			myColor = YELLOW
		2: 
			$Sprite2D.modulate = RED
			myColor = RED
		3: 
			$Sprite2D.modulate = GREEN
			myColor = GREEN
		4:
			$Sprite2D.modulate = BLUE
			myColor = BLUE
	"""
	pass # Replace with function body.

var perfect_timing

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# ##############################################################################################################################aLERT
	
	if poppable == true:
		$Sprite2D.modulate.a = 255
	else: $Sprite2D.modulate.a = 0.2
	
	if current_beat == target_beat - 4:
		visible = true
		$Node2D.shrinking = true
		$Node2D.COLOR = myColor
		#$Node2D.COLOR.a = 0.5
		$Node2D.tween_duration = sec_per_beat * 3
		$Beat_Quality_Timer.start()
	if current_beat == target_beat - 1:
		#perfect_timing = get_system
		if poppable == false:
			start_time = Time.get_ticks_msec()
			target_time = start_time + (sec_per_beat * 1500)
			poppable = true
		
	
	if current_beat == target_beat:
		#start a timer for number of Points, the further away 
		#it is from the solutionthe fewer points you get.
		pass
	
	if current_beat == target_beat + 2:
		if popped == false:
			circle_not_popped.emit()
			popped = true
		poppable = false
		$Node2D.visible = false
		$break_particles.emitting = true
		$CollisionShape2D.disabled = true
		$Sprite2D.visible = false
		await $break_particles.finished
		queue_free()
		
		
	#$Sprite2D.scale.y = $Sprite2D.scale.y *0.99
	#$Sprite2D.scale.x = $Sprite2D.scale.x *0.99
	pass

func _on_mouse_entered() -> void:
	mouse_in = true
	pass # Replace with function body.

func _on_mouse_exited() -> void:
	mouse_in = false
	pass # Replace with function body.
var quality
func _input(event: InputEvent) -> void:
	
	# Color handler ---------------------------------------------------------*
	if(event.is_action_pressed("ui_one")):
		one_pressed = true
	elif event.is_action_pressed("ui_two"):
		two_pressed =true
	elif event.is_action_pressed("ui_three"):
		three_pressed = true
	elif event.is_action_pressed("ui_four"):
		four_pressed = true
	
	if(event.is_action_released("ui_one")):
		one_pressed = false
	elif event.is_action_released("ui_two"):
		two_pressed = false
	elif event.is_action_released("ui_three"):
		three_pressed = false
	elif event.is_action_released("ui_four"):
		four_pressed = false
	# Color handler ---------------------------------------------------------*
	
	# Stomp handler ---------------------------------------------------------*
	if mouse_in == true and poppable:
		if myColor == YELLOW:
			if one_pressed and event.is_action_pressed("stomp"):
				pop_time = Time.get_ticks_msec()
				difference = abs(pop_time - target_time)
				print(difference)
				
				if difference < perfect_threshold:
					print("Perfect")
					quality = 3
				elif difference < great_threshold:
					print("Great!")
					quality = 2
				elif difference < good_threshold:
					print("Good")
					quality = 1
				else:
					print("Ok...")
					quality = 0
				emit_signal("circle_popped", quality)
				queue_free()
		elif myColor == RED:
			if two_pressed and event.is_action_pressed("stomp"):
				pop_time = Time.get_ticks_msec()
				difference = abs(pop_time - target_time)
				print(difference)
				
				if difference < perfect_threshold:
					print("Perfect")
					quality = 3
				elif difference < great_threshold:
					print("Great!")
					quality = 2
				elif difference < good_threshold:
					print("Good")
					quality = 1
				else:
					print("Ok...")
					quality = 0
				emit_signal("circle_popped", quality)
				queue_free()
		elif myColor == GREEN:
			if three_pressed and event.is_action_pressed("stomp"):
				pop_time = Time.get_ticks_msec()
				difference = abs(pop_time - target_time)
				print(difference)
				
				if difference < perfect_threshold:
					print("Perfect")
					quality = 3
				elif difference < great_threshold:
					print("Great!")
					quality = 2
				elif difference < good_threshold:
					print("Good")
					quality = 1
				else:
					print("Ok...")
					quality = 0
				emit_signal("circle_popped", quality)
				queue_free()
		elif myColor == BLUE:
			if four_pressed and event.is_action_pressed("stomp"):
				pop_time = Time.get_ticks_msec()
				difference = abs(pop_time - target_time)
				print(difference)
				
				if difference < perfect_threshold:
					print("Perfect")
					quality = 3
				elif difference < great_threshold:
					print("Great!")
					quality = 2
				elif difference < good_threshold:
					print("Good")
					quality = 1
				else:
					print("Ok...")
					quality = 0
				emit_signal("circle_popped", quality)
				queue_free()
		elif myColor == WHITE:
			if event.is_action_pressed("stomp"):
				pop_time = Time.get_ticks_msec()
				difference = abs(pop_time - target_time)
				print(difference)
				
				if difference < perfect_threshold:
					print("Perfect")
					quality = 3
				elif difference < great_threshold:
					print("Great!")
					quality = 2
				elif difference < good_threshold:
					print("Good")
					quality = 1
				else:
					print("Ok...")
					quality = 0
				emit_signal("circle_popped", quality)
				queue_free()
	# Stomp handler ---------------------------------------------------------*


func beat_listener(beat: int) ->void:
	current_beat = beat
