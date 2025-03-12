extends Node2D
var beat_scale = Vector2(.2,.2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset():
	$Sprite2D4.scale = beat_scale
	$Sprite2D3.scale = beat_scale
	$Sprite2D2.scale = beat_scale
	$Stomp_spot.scale = beat_scale
	
	$Sprite2D4.modulate = Color(1,1,1)
	$Sprite2D3.modulate = Color(1,1,1)
	$Sprite2D2.modulate = Color(1,1,1)
	$Stomp_spot.modulate = Color(1,1,1)
