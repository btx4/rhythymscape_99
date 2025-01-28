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
	print(targetBeat)
	for t in targetBeat.duplicate():
		print(t)
		if currentBeat + 3 == t:
			$Sprite2D4.scale = Vector2(1.5,1.5)
			$Sprite2D3.scale = Vector2(1,1)
			$Sprite2D2.scale = Vector2(1,1)
			$Stomp_spot.scale = Vector2(1,1)
			print("three away!")
		elif currentBeat + 2 == t:
			$Sprite2D4.scale = Vector2(1,1)
			$Sprite2D3.scale = Vector2(1.5,1.5)
			$Sprite2D2.scale = Vector2(1,1)
			$Stomp_spot.scale = Vector2(1,1)
			print("two away!")
		elif currentBeat + 1 == t:
			$Sprite2D4.scale = Vector2(1,1)
			$Sprite2D3.scale = Vector2(1,1)
			$Sprite2D2.scale = Vector2(1.5,1.5)
			$Stomp_spot.scale = Vector2(1,1)
			print("one away!")
		elif currentBeat == t:
			$Sprite2D4.scale = Vector2(1,1)
			$Sprite2D3.scale = Vector2(1,1)
			$Sprite2D2.scale = Vector2(1,1)
			$Stomp_spot.scale = Vector2(1.5,1.5)
		elif currentBeat == t + 1:
			$Sprite2D4.scale = Vector2(1,1)
			$Sprite2D3.scale = Vector2(1,1)
			$Sprite2D2.scale = Vector2(1,1)
			$Stomp_spot.scale = Vector2(1,1)
			targetBeat.erase(t)  # Remove t from the array
	pass
