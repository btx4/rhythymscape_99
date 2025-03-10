extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func move(value: int):
	position.x = remap(value, 0, get_parent().max_value, get_parent().position.x, get_parent().position.x + get_parent().size.x) 

	
