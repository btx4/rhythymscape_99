extends ColorRect
var down = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if down:
		position.y = position.y + 1
		if position.y > 160:
			down = !down
		pass
	else:
		position.y = position.y - 1
		if position.y < -72:
			down = !down
