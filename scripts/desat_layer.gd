extends CanvasLayer
var degree_of_sat
var opacity = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func sat_down():
	opacity = opacity + 0.2
	$Sprite2D.material.set("shader_parameter/opacity", opacity)
	if opacity > .70:
		opacity = 0
		$Sprite2D.material.set("shader_parameter/opacity", opacity)
		get_tree().reload_current_scene()

func sat_up():
	opacity = opacity - 0.2
	if opacity < 0:
		opacity = 0
	$Sprite2D.material.set("shader_parameter/opacity", opacity)
