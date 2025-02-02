extends Node2D
var currentBeat = 0
var targetBeat = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventScript.beat.connect(beat_listener)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass


func beat_listener(beat: int) ->void:
	currentBeat = beat
	#print(targetBeat)
	
	$Sprite2D7.scale = Vector2(.5,.5)
	$Sprite2D6.scale = Vector2(.5,.5)
	$Sprite2D5.scale = Vector2(.5,.5)
	$Sprite2D4.scale = Vector2(.5,.5)
	$Sprite2D3.scale = Vector2(.5,.5)
	$Sprite2D2.scale = Vector2(.5,.5)
	$Stomp_spot.scale = Vector2(.5,.5)
	
	$Sprite2D7.modulate = Color(1,1,1)
	$Sprite2D6.modulate = Color(1,1,1)
	$Sprite2D5.modulate = Color(1,1,1)
	$Sprite2D4.modulate = Color(1,1,1)
	$Sprite2D3.modulate = Color(1,1,1)
	$Sprite2D2.modulate = Color(1,1,1)
	$Stomp_spot.modulate = Color(1,1,1)
	
	for t in targetBeat.duplicate():
		#print(t)
		if currentBeat + 6 == t[0]:
			$Sprite2D7.scale = Vector2(1.5,1.5)
			$Sprite2D7.modulate = t[1]
			#print("5 away!")
		elif currentBeat + 5 == t[0]:
			$Sprite2D6.scale = Vector2(1.5,1.5)
			$Sprite2D6.modulate = t[1]
			#print("5 away!")
		elif currentBeat + 4 == t[0]:
			$Sprite2D5.scale = Vector2(1.5,1.5)
			$Sprite2D5.modulate = t[1]
			#print("4 away!")
		elif currentBeat + 3 == t[0]:
			$Sprite2D4.scale = Vector2(1.5,1.5)
			$Sprite2D4.modulate = t[1]
			#print("3 away!")
		elif currentBeat + 2 == t[0]:
			$Sprite2D3.scale = Vector2(1.5,1.5)
			$Sprite2D3.modulate = t[1]
			#print("2 away!")
		elif currentBeat + 1 == t[0]:
			$Sprite2D2.scale = Vector2(1.5,1.5)
			$Sprite2D2.modulate = t[1]
			#print("1 away!")
		elif currentBeat == t[0]:
			$Stomp_spot.scale = Vector2(1.5,1.5)
			$Stomp_spot.modulate = t[1]
		elif currentBeat == t[0] + 1:
			targetBeat.erase(t)  # Remove t from the array
	pass
