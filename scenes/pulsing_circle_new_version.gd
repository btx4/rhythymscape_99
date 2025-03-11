extends Node2D
var currentBeat = 0
var targetBeat = []

var RED = Color(1,0,0)
var BLUE = Color(0,0,1)
var YELLOW = Color(1,1,0)
var GREEN = Color(0,1,0)

var red
var blu
var yel
var gre

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventScript.beat.connect(beat_listener)
	pass # Replace with function body.

func _process(delta: float) -> void:
	#rotation = rotation + 0.01 
	pass

# New TargetBeat has 5 elements. 0th is the number targeting. 1, 2, 3, and 4 are whether it is yellow, red, green, or blue.
func beat_listener(beat: int) ->void:
	currentBeat = beat
	$"Yellow Input".reset()
	$"Green Input".reset()
	$"Red Input".reset()
	$"Blue Input".reset()
	
	for t in targetBeat.duplicate():
		if t[1] == YELLOW:     #Yellow
			if currentBeat + 3 == t[0]:
				$"Yellow Input/Sprite2D4".scale = Vector2(1.5,1.5)
				$"Yellow Input/Sprite2D4".modulate = t[1]
				#print("3 away!")
			elif currentBeat + 2 == t[0]:
				$"Yellow Input/Sprite2D3".scale = Vector2(1.5,1.5)
				$"Yellow Input/Sprite2D3".modulate = t[1]
				#print("2 away!")
			elif currentBeat + 1 == t[0]:
				$"Yellow Input/Sprite2D2".scale = Vector2(1.5,1.5)
				$"Yellow Input/Sprite2D2".modulate = t[1]
				#print("1 away!")
			elif currentBeat == t[0]:
				$"Yellow Input/Stomp_spot".scale = Vector2(1.5,1.5)
				$"Yellow Input/Stomp_spot".modulate = t[1]
				$Stomp_handler.stompShit(YELLOW)
			elif currentBeat == t[0] + 1:
				targetBeat.erase(t)  # Remove t from the array
		if t[1] == RED:     #Red
			if currentBeat + 3 == t[0]:
				$"Red Input/Sprite2D4".scale = Vector2(1.5,1.5)
				$"Red Input/Sprite2D4".modulate = t[1]
				#print("3 away!")
			elif currentBeat + 2 == t[0]:
				$"Red Input/Sprite2D3".scale = Vector2(1.5,1.5)
				$"Red Input/Sprite2D3".modulate = t[1]
				#print("2 away!")
			elif currentBeat + 1 == t[0]:
				$"Red Input/Sprite2D2".scale = Vector2(1.5,1.5)
				$"Red Input/Sprite2D2".modulate = t[1]
				#print("1 away!")
			elif currentBeat == t[0]:
				$"Red Input/Stomp_spot".scale = Vector2(1.5,1.5)
				$"Red Input/Stomp_spot".modulate = t[1]
				$Stomp_handler.stompShit(RED)
			elif currentBeat == t[0] + 1:
				targetBeat.erase(t)  # Remove t from the array
		if t[1] == GREEN:     #Green
			if currentBeat + 3 == t[0]:
				$"Green Input/Sprite2D4".scale = Vector2(1.5,1.5)
				$"Green Input/Sprite2D4".modulate = t[1]
				#print("3 away!")
			elif currentBeat + 2 == t[0]:
				$"Green Input/Sprite2D3".scale = Vector2(1.5,1.5)
				$"Green Input/Sprite2D3".modulate = t[1]
				#print("2 away!")
			elif currentBeat + 1 == t[0]:
				$"Green Input/Sprite2D2".scale = Vector2(1.5,1.5)
				$"Green Input/Sprite2D2".modulate = t[1]
				#print("1 away!")
			elif currentBeat == t[0]:
				$"Green Input/Stomp_spot".scale = Vector2(1.5,1.5)
				$"Green Input/Stomp_spot".modulate = t[1]
				$Stomp_handler.stompShit(GREEN)
			elif currentBeat == t[0] + 1:
				targetBeat.erase(t)  # Remove t from the array
		if t[1] == BLUE:     #Blue
			if currentBeat + 3 == t[0]:
				$"Blue Input/Sprite2D4".scale = Vector2(1.5,1.5)
				$"Blue Input/Sprite2D4".modulate = t[1]
				#print("3 away!")
			elif currentBeat + 2 == t[0]:
				$"Blue Input/Sprite2D3".scale = Vector2(1.5,1.5)
				$"Blue Input/Sprite2D3".modulate = t[1]
				#print("2 away!")
			elif currentBeat + 1 == t[0]:
				$"Blue Input/Sprite2D2".scale = Vector2(1.5,1.5)
				$"Blue Input/Sprite2D2".modulate = t[1]
				#print("1 away!")
			elif currentBeat == t[0]:
				$"Blue Input/Stomp_spot".scale = Vector2(1.5,1.5)
				$"Blue Input/Stomp_spot".modulate = t[1]
				$Stomp_handler.stompShit(BLUE)
			elif currentBeat == t[0] + 1:
				targetBeat.erase(t)  # Remove t from the array
	pass


var red_hittable = true
var blue_hittable = true
var green_hittable = true
var yellow_hittable = true

func _input(event: InputEvent) -> void:
	
	#if event.is_action_pressed("pause"):
		#print("Paused")
		#get_parent().get_node("PauseMenu").toggle_pause
	#THIS ISN'T WORKING WELL W THE CAMERA AND VIEWPORT, CHANGING IT TO JUST "WHEN THIS BUTTON IS PRESSED, NAVIGATE TO THIS SCENE"	
		
		
	if event.is_action_pressed("yellow") and yellow_hittable:
		$"Stomp Buttons/Yellow_stomp".restart()
		yel = true
		$"Stomp Buttons/Button_Yellow".trigger()
	elif event.is_action_pressed("red") and red_hittable:
		$"Stomp Buttons/Red_stomp".restart()
		red = true
		$"Stomp Buttons/Button_Red".trigger()
	elif event.is_action_pressed("green") and green_hittable:
		$"Stomp Buttons/Green_stomp".restart()
		gre = true
		$"Stomp Buttons/Button_Green".trigger()
	elif event.is_action_pressed("blue") and blue_hittable:
		$"Stomp Buttons/Blue_stomp".restart()
		blu = true
		$"Stomp Buttons/Button_Blue".trigger()
	if red:
		$"Stomp Buttons/Red_stomp".emitting = true
	if blu:
		$"Stomp Buttons/Blue_stomp".emitting = true
	if yel:
		$"Stomp Buttons/Yellow_stomp".emitting = true
	if gre:
		$"Stomp Buttons/Green_stomp".emitting = true
	if event.is_action_pressed("stomp"):
		$"Stomp Buttons/Button_center".trigger()
		if (not red and not blu and not gre and not yel):
			$"Stomp Buttons/White_stomp".restart()
			$"Stomp Buttons/White_stomp".emitting = true
			pass
		print("HERE")
	
	if event.is_action_released("yellow"):
		yel = false
		$"Stomp Buttons/Button_Yellow".untrigger()
	elif event.is_action_released("red"):
		red = false
		$"Stomp Buttons/Button_Red".untrigger()
	elif event.is_action_released("green"):
		gre = false
		$"Stomp Buttons/Button_Green".untrigger()
	elif event.is_action_released("blue"):
		blu = false
		$"Stomp Buttons/Button_Blue".untrigger()
	elif event.is_action_released("stomp"):
		$"Stomp Buttons/Button_center".untrigger()
