extends Node2D

@export var fade_speed: float = 0.3  # Speed at which the node fades
var fading = false
var done = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a = 1.0  # Ensure the node starts fully visible

func _process(delta: float) -> void:
	if fading:
		fade_out(delta)

func fade_out(delta: float) -> void:
	modulate.a -= fade_speed * delta  # Reduce alpha over time
	if !done:
		$"Everything_but_draw/Sprite2D/Start point/Break_radius".clear_notes()
		done = true
	fading = true
	if modulate.a <= 0.02:  # Threshold to remove the node
		queue_free()
