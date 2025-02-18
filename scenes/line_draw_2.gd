extends Node2D

@export var point_a: Vector2 = Vector2(100, 100)
@export var point_b: Vector2 = Vector2(300, 300)
@export var line_color: Color = Color(1, 0, 0)  # Red
@export var line_width: float = 4.0

func _ready() -> void:
	point_a = Vector2(get_parent().get_node("Start_circle/start_circle_position").global_position)
	point_a.y = point_a.y -16
	point_b = Vector2(get_parent().get_node("Circle/end_circle_position").global_position)
	point_b.y = point_b.y - 16
	print(point_b)
	print(point_a)

func _draw():
	
	draw_line(point_a, point_b, line_color, line_width)

func _process(delta):
	_draw()  # Continuously redraw the line if the points change
