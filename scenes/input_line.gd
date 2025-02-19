extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset():
	$Sprite2D4.scale = Vector2(.5,.5)
	$Sprite2D3.scale = Vector2(.5,.5)
	$Sprite2D2.scale = Vector2(.5,.5)
	$Stomp_spot.scale = Vector2(.5,.5)
	
	$Sprite2D4.modulate = Color(1,1,1)
	$Sprite2D3.modulate = Color(1,1,1)
	$Sprite2D2.modulate = Color(1,1,1)
	$Stomp_spot.modulate = Color(1,1,1)
