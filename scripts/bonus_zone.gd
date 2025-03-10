extends Area2D
var score = false
var points = 1
var started = false

@export var fading_points_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventScript.beat.connect(beat_listener)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if started:
		$Sprite2D.scale = $Sprite2D.scale * 0.99
	pass

func beat_listener(beat: int) ->void:
	started = true
	if beat% 16 == 0:
		position.x = randi_range(0,get_viewport().get_visible_rect().size.x)
		position.y = randi_range(0,get_viewport().get_visible_rect().size.y)
	$Sprite2D.scale = Vector2(13,13)
	if score:
		EventScript.report_points(points)
		points =floor( points * 1.2)
		var new_scene = fading_points_scene.instantiate()
		new_scene.text = "+ " + str(points)
		new_scene.position = get_global_mouse_position()
		new_scene.position.x = new_scene.position.x-30
		new_scene.position.y = new_scene.position.y-30
		get_parent().add_child(new_scene)
	else:
		points = 5
	pass


func _on_mouse_entered() -> void:
	#modulate = Color(1,1,0)
	score = true
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	#modulate = Color(1,0,0)
	score = false
	pass # Replace with function body.
