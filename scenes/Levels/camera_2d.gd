extends Camera2D
var beat = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	EventScript.beat.connect(beat_listener)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if beat > -1:
		zoom = zoom * 0.999
	
	pass


func beat_listener(beat: int) ->void:
	print(beat)
	if beat > -1:
		zoom = Vector2(1,1)
	pass
