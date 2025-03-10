extends Node2D
var basePos
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	basePos = $Circles.position
	pass # Replace with function body.

"""
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("stomp"):
		start()
"""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func pop():
	$Pop.pitch_scale = $Pop.pitch_scale + 0.1
	$Pop.play()


func no_pop():
	$Pop.play()

func start():
	$Circles.position = basePos
	$Circles.position.x += randi_range(-100,900)
	$Circles.position.y += randi_range(-300,300)
	$Circles.spawn_circles()
	$Circles
	$Pop.pitch_scale = 1
