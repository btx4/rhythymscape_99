extends Node2D
var beat_start
var beat_diff = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Area2D.target_beat = beat_start + beat_diff
	$Area2D2.target_beat = beat_start + 2*beat_diff
	$Area2D3.target_beat = beat_start + 3*beat_diff
	$Area2D4.target_beat = beat_start + 4*beat_diff
	$Area2D5.target_beat = beat_start + 5*beat_diff
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
