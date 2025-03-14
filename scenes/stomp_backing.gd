extends Sprite2D
var started = false
var originalScale = Vector2(0.75,0.75)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventScript.beat.connect(beat_listener)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if started:
		scale = scale * .9995
	pass

func beat_listener(beat: int) ->void:
	started = true
	scale = originalScale
