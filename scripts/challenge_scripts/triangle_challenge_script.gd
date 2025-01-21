extends Node2D
var beat_start

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Area2D.target_beat = beat_start + 4
	$Area2D2.target_beat = beat_start + 6
	$Area2D3.target_beat = beat_start + 8
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
