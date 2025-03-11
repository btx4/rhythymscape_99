extends Area2D
var popped = false
var color
var index = 15
var popping_protocol = false
var hitit = false
var disabled = false
var rotated = false

var pop_window_actual
var pop_window_start
var pop_window_difference
var pop_window_target
var score = 0
var target_difference = 0
var boomed = false

@export var seconds_per_beat = 0.4317

var quality = -1

var thresh_perf = 25
var thresh_great = 50
var thresh_good = 100


signal circle_popped(quality: int)
signal circle_not_popped

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	z_index = 0.1
	if color == null:
		color = Color(1,1,1)
	$Sprite2D.modulate = color
	position_change()
	EventScript.beat.connect(beat_listener)
	if color == EventScript.YELLOW:
		index = 0
	elif color == EventScript.RED:
		index = 5
	elif color == EventScript.GREEN:
		index = 10
	elif color == EventScript.BLUE:
		index = 15
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if !disabled:
		if popping_protocol:
			if event.is_action_pressed("red") and color == EventScript.RED:
				hitit = true
			if event.is_action_pressed("yellow") and color == EventScript.YELLOW:
				hitit = true
			if event.is_action_pressed("green") and color == EventScript.GREEN:
				hitit = true
			if event.is_action_pressed("blue") and color == EventScript.BLUE:
				hitit = true
			if hitit:
				$Explosion.explode()
				hitit = false
				boomed = true
				$Sprite2D.visible = false
				delete_bomb = true
				
var blow = false
var fails = 0
var delete_bomb = false
func position_change():
	if delete_bomb:
		$Sprite2D.visible = false
		if blow == true:
			queue_free()
		blow = true
	if !boomed:
	#Bound Checking
		if index > 19:
			index = index % 20
		
		if popping_protocol:
			if fails == 1:
				circle_not_popped.emit()
				#queue_free()
			fails = fails + 1
		
		if index >=0 and index <=4:
			change_color(EventScript.YELLOW)
		elif index >= 5 and index <= 9:
			change_color(EventScript.RED)
		elif index >= 10 and index <= 14:
			change_color(EventScript.GREEN)
		elif index >= 15 and index <= 19:
			change_color(EventScript.BLUE)
		
		match index:
			#YELLOWS
			0:
				global_position = get_parent().get_node("Pulsing_circle/Yellow Input/Sprite2D5").global_position
			1:
				global_position = get_parent().get_node("Pulsing_circle/Yellow Input/Sprite2D4").global_position
			2:
				global_position = get_parent().get_node("Pulsing_circle/Yellow Input/Sprite2D3").global_position
			3:
				global_position = get_parent().get_node("Pulsing_circle/Yellow Input/Sprite2D2").global_position
				popping_protocol = true
				pop_window_start = Time.get_ticks_msec()
				pop_window_target = pop_window_start + (seconds_per_beat *1000)
				print("Start:" + str(pop_window_start) + "AND  the target window is" + str(pop_window_target))
			4:
				global_position = get_parent().get_node("Pulsing_circle/Yellow Input/Stomp_spot").global_position
				pop_window_target = Time.get_ticks_msec()
				delete_bomb = true
				popping_protocol = true
			#REDS
			5:
				global_position = get_parent().get_node("Pulsing_circle/Red Input/Sprite2D5").global_position
			6:
				global_position = get_parent().get_node("Pulsing_circle/Red Input/Sprite2D4").global_position
			7:
				global_position = get_parent().get_node("Pulsing_circle/Red Input/Sprite2D3").global_position
			8:
				global_position = get_parent().get_node("Pulsing_circle/Red Input/Sprite2D2").global_position
				popping_protocol = true
				pop_window_start = Time.get_ticks_msec()
				pop_window_target = pop_window_start + (seconds_per_beat *1000)
			9:
				global_position = get_parent().get_node("Pulsing_circle/Red Input/Stomp_spot").global_position
				pop_window_target = Time.get_ticks_msec()
				delete_bomb = true
				popping_protocol = true
			#GREENS
			10:
				global_position = get_parent().get_node("Pulsing_circle/Green Input/Sprite2D5").global_position
			11:
				global_position = get_parent().get_node("Pulsing_circle/Green Input/Sprite2D4").global_position
			12:
				global_position = get_parent().get_node("Pulsing_circle/Green Input/Sprite2D3").global_position
			13:
				global_position = get_parent().get_node("Pulsing_circle/Green Input/Sprite2D2").global_position
				popping_protocol = true
				pop_window_start = Time.get_ticks_msec() 
				pop_window_target = pop_window_start + (seconds_per_beat *1000)
			14:
				global_position = get_parent().get_node("Pulsing_circle/Green Input/Stomp_spot").global_position
				pop_window_target = Time.get_ticks_msec()
				delete_bomb = true
				popping_protocol = true
			#BLUES
			15:
				global_position = get_parent().get_node("Pulsing_circle/Blue Input/Sprite2D5").global_position
			16:
				global_position = get_parent().get_node("Pulsing_circle/Blue Input/Sprite2D4").global_position
			17:
				global_position = get_parent().get_node("Pulsing_circle/Blue Input/Sprite2D3").global_position
			18:
				global_position = get_parent().get_node("Pulsing_circle/Blue Input/Sprite2D2").global_position
				popping_protocol = true
				pop_window_start = Time.get_ticks_msec()
				pop_window_target = pop_window_start + (seconds_per_beat *1000)
			19:
				global_position = get_parent().get_node("Pulsing_circle/Blue Input/Stomp_spot").global_position
				pop_window_target = Time.get_ticks_msec()

				delete_bomb = true
				popping_protocol = true
				
			_:
				global_position = get_parent().get_node("Pulsing_circle").global_position
				pop_window_start = Time.get_ticks_msec()
				popping_protocol = true
				delete_bomb = true
				
				
	

func beat_listener(beat: int) ->void:
	index = index + 1
	if delete_bomb:
		$Sprite2D.visible = false
		
		if blow == true:
			queue_free()
		blow = true
		
	if !boomed:
		if index > 19:
			index = index % 20
		
		if popping_protocol:
			if fails == 1:
				circle_not_popped.emit()
				#queue_free()
			fails = fails + 1
		
		if index >=0 and index <=4:
			change_color(EventScript.YELLOW)
		elif index >= 5 and index <= 9:
			change_color(EventScript.RED)
		elif index >= 10 and index <= 14:
			change_color(EventScript.GREEN)
		elif index >= 15 and index <= 19:
			change_color(EventScript.BLUE)
		
		match index:
			#YELLOWS
			0:
				global_position = get_parent().get_node("Pulsing_circle/Yellow Input/Sprite2D5").global_position
			1:
				global_position = get_parent().get_node("Pulsing_circle/Yellow Input/Sprite2D4").global_position
			2:
				global_position = get_parent().get_node("Pulsing_circle/Yellow Input/Sprite2D3").global_position
			3:
				global_position = get_parent().get_node("Pulsing_circle/Yellow Input/Sprite2D2").global_position
				popping_protocol = true
				pop_window_start = Time.get_ticks_msec()
				pop_window_target = pop_window_start + (seconds_per_beat *1000)
				print("Start:" + str(pop_window_start) + "AND  the target window is" + str(pop_window_target))
			4:
				global_position = get_parent().get_node("Pulsing_circle/Yellow Input/Stomp_spot").global_position
				pop_window_target = Time.get_ticks_msec()
				popping_protocol = true
				delete_bomb = true
			#REDS
			5:
				global_position = get_parent().get_node("Pulsing_circle/Red Input/Sprite2D5").global_position
			6:
				global_position = get_parent().get_node("Pulsing_circle/Red Input/Sprite2D4").global_position
			7:
				global_position = get_parent().get_node("Pulsing_circle/Red Input/Sprite2D3").global_position
			8:
				global_position = get_parent().get_node("Pulsing_circle/Red Input/Sprite2D2").global_position
				popping_protocol = true
				pop_window_start = Time.get_ticks_msec()
				pop_window_target = pop_window_start + (seconds_per_beat *1000)
			9:
				global_position = get_parent().get_node("Pulsing_circle/Red Input/Stomp_spot").global_position
				pop_window_target = Time.get_ticks_msec()
				popping_protocol = true
				delete_bomb = true
			#GREENS
			10:
				global_position = get_parent().get_node("Pulsing_circle/Green Input/Sprite2D5").global_position
			11:
				global_position = get_parent().get_node("Pulsing_circle/Green Input/Sprite2D4").global_position
			12:
				global_position = get_parent().get_node("Pulsing_circle/Green Input/Sprite2D3").global_position
			13:
				global_position = get_parent().get_node("Pulsing_circle/Green Input/Sprite2D2").global_position
				popping_protocol = true
				pop_window_start = Time.get_ticks_msec() 
				pop_window_target = pop_window_start + (seconds_per_beat *1000)
			14:
				global_position = get_parent().get_node("Pulsing_circle/Green Input/Stomp_spot").global_position
				pop_window_target = Time.get_ticks_msec()
				popping_protocol = true
				delete_bomb = true
			#BLUES
			15:
				global_position = get_parent().get_node("Pulsing_circle/Blue Input/Sprite2D5").global_position
			16:
				global_position = get_parent().get_node("Pulsing_circle/Blue Input/Sprite2D4").global_position
			17:
				global_position = get_parent().get_node("Pulsing_circle/Blue Input/Sprite2D3").global_position
			18:
				global_position = get_parent().get_node("Pulsing_circle/Blue Input/Sprite2D2").global_position
				popping_protocol = true
				pop_window_start = Time.get_ticks_msec()
				pop_window_target = pop_window_start + (seconds_per_beat *1000)
			19:
				global_position = get_parent().get_node("Pulsing_circle/Blue Input/Stomp_spot").global_position
				pop_window_target = Time.get_ticks_msec()
				delete_bomb = true

				popping_protocol = true
				
			_:
				global_position = get_parent().get_node("Pulsing_circle").global_position
				pop_window_start = Time.get_ticks_msec()
				popping_protocol = true

func change_color(new_color :Color):
	color = new_color
	$Sprite2D.modulate = new_color
	pass
