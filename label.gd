extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	z_index = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	modulate.a -= 5
	self_modulate.a -= 5
	pass
