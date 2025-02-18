extends Sprite2D
var started = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self_modulate.a = .25
	EventScript.beat.connect(beat_listener)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if started:
		scale = scale * .999
	pass

func trigger():
	self_modulate.a = 1

func untrigger():
	self_modulate.a = .25

func beat_listener(beat: int) ->void:
	started = true
	scale = Vector2(1,1)
