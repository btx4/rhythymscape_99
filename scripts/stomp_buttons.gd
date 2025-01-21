extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("yellow"):
		$Button_Yellow.trigger()
	elif event.is_action_pressed("red"):
		$Button_Red.trigger()
	elif event.is_action_pressed("green"):
		$Button_Green.trigger()
	elif event.is_action_pressed("blue"):
		$Button_Blue.trigger()
	elif event.is_action_pressed("stomp"):
		$Button_center.trigger()
		print("HERE")
	
	if event.is_action_released("yellow"):
		$Button_Yellow.untrigger()
	elif event.is_action_released("red"):
		$Button_Red.untrigger()
	elif event.is_action_released("green"):
		$Button_Green.untrigger()
	elif event.is_action_released("blue"):
		$Button_Blue.untrigger()
	elif event.is_action_released("stomp"):
		$Button_center.untrigger()
