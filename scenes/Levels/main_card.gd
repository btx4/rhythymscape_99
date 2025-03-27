extends Node2D
var started = false
var originalScale = Vector2(0.25,0.21)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventScript.beat.connect(beat_listener)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if started:
		scale = scale * .9992
	pass

func beat_listener(beat: int) ->void:
	started = true
	scale = originalScale
