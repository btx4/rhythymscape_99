extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self_modulate.a = .25
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func trigger():
	self_modulate.a = 1

func untrigger():
	self_modulate.a = .25
