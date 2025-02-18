extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var child1 = get_node_or_null("MouseAreaRight")
	var child2 = get_node_or_null("MouseAreaLeft")

	if child1 == null and child2 == null:
		print("ooga")
		queue_free()
	pass
