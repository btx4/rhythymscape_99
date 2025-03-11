extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func explode():
	$Gray.restart()
	$yellow.restart()
	$red.restart()
	$Gray.emitting = true
	$red.emitting = true
	$yellow.emitting = true
	$Boom.play()
