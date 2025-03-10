extends Area2D
var counter = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	$MouseLabel.text = "OUT"
	$Sprite2D.modulate = Color(.466,0,.059)
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	counter = counter - 1
	$MouseLabel.text = "IN!"
	$Sprite2D.modulate = Color(.085,.284,0.12)
	if counter > 0:
		$Counter.text = str(counter)
	else:
		queue_free()
	pass # Replace with function body.
