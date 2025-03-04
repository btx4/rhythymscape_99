extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start()
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
	$Circles.spawn_circles()
	$Pop.pitch_scale = 1
