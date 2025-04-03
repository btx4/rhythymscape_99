extends Area2D
var hit = false
@export var nice_scene : PackedScene
@export var oops_scene : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	pop()
	pass # Replace with function body.

func pop() -> void:
	var new_scene = nice_scene.instantiate()
	new_scene.position = global_position
	
	get_parent().get_parent().add_child(new_scene)
	get_parent().get_parent().pop()
	emit_signal("circle_popped", 5)
	queue_free()
	EventScript.report_points(5)


func _on_despawn_timer_timeout() -> void:
	var new_scene = oops_scene.instantiate()
	new_scene.position = global_position
	get_parent().get_parent().add_child(new_scene)
	
	get_parent().get_parent().no_pop()
	queue_free()
	pass # Replace with function body.
