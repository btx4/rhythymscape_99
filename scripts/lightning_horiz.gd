extends ColorRect
var rToL = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rToL:
		position.x = position.x -1 
		if position.x < 544:
			rToL = !rToL
		pass
	else:
		position.x = position.x +1 
		if position.x > 728:
			rToL = !rToL
