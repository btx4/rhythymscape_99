extends Node2D

# Initial radius of the circle
var radius: float = 100.0
var shrinking = false
var COLOR = Color(1,1,1)
# Rate at which the circle shrinks (pixels per second)
var shrink_rate: float = 20.0
var tween
var tween_duration
var second_circle

func _process(delta: float) -> void:
	# Reduce the radius linearly over times
	if shrinking:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "radius", 16, tween_duration)
		tween.tween_property(self, "COLOR:a", 1.0, tween_duration)  # Tween alpha to fully opaque
		tween.play()
		tween.set_ease(3)
		tween.set_trans(0)
		
		queue_redraw()

func _draw() -> void:
	second_circle = Color(COLOR.r,COLOR.g,COLOR.b,0.5)
	# Draw the circle with the current radius
	
	if radius > 16 and shrinking:
		draw_circle(Vector2.ZERO, radius, COLOR, false,4)  # Red circle
	draw_circle(Vector2.ZERO, 16, second_circle, false,4)  # Red circle
