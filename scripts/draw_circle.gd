extends Node2D

# Initial radius of the circle
var radius: float = 100.0
var shrinking = false
var COLOR = Color(1,1,1)
@export var glow_material: ShaderMaterial
# Rate at which the circle shrinks (pixels per second)
var shrink_rate: float = 20.0
var tween
var tween_duration
var second_circle
var shrinking_alpha = 0.5
var shrinking_color
func _process(delta: float) -> void:
	
	# Reduce the radius linearly over times
	if shrinking:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "radius", 16, tween_duration)
		tween.tween_property(self, "shrinking_alpha", 1.0, tween_duration)  # Tween alpha to fully opaque
		tween.play()
		tween.set_ease(3)
		tween.set_trans(0)
		
		queue_redraw()

func _draw() -> void:
	shrinking_color = Color(COLOR.r,COLOR.g,COLOR.b,shrinking_alpha)
	second_circle = Color(COLOR.r,COLOR.g,COLOR.b,0.5)
	
	if material and material is ShaderMaterial:
		material.set_shader_parameter("glow_color", shrinking_color)		
	# Draw the circle with the current radius
	
	if radius > 16 and shrinking:
		draw_circle(Vector2.ZERO, radius, shrinking_color, false,4)  # Red circle
	draw_circle(Vector2.ZERO, 16, second_circle, false,4)  # Red circle
