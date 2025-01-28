extends Node2D

@export var instance_scene: PackedScene  # Drag and drop your scene in the Inspector
@export var spawn_count: int = 180  # Number of instances to spawn

var SPEED = 5

func _ready() -> void:
	z_index = 2
	$Despawn_timer.start()
	pass

func _process(delta: float) -> void:
	# Move in the direction of the rotation
	var direction = Vector2.UP.rotated(rotation) 
	position += direction * 5  
	
	spawn_instances()
	
var dir = false
func spawn_instances() -> void:
	var instance = instance_scene.instantiate()
	var direction = Vector2.LEFT.rotated(rotation)
	var perpendicular = direction.rotated(PI) # spawn w/ direction perpendicular to the direction of the paint can
	if dir:
		instance.speed = randi_range(0,120)
		dir = !dir
	else:
		instance.speed = randi_range(-120,0)
		dir = !dir
	instance.position = position
	instance.direction = direction

	# Add the instance to the parent node
	get_parent().add_child(instance)


func _on_despawn_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.
