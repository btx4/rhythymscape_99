extends RigidBody2D

var health = 5
var speed = 5
var direction = Vector2.ZERO
var recalc = 0


func _ready() -> void:
	var screen_center = get_viewport_rect().size / 2
	direction = (screen_center - global_position).normalized()

func _process(delta: float) -> void:
	move_and_collide(direction)
	#print("Location:" + str(global_position))
	recalc = recalc + 1
	#print(str(recalc))
	if recalc == 25:
		recalc = 0
		calc_direction()

func calc_direction():
	var screen_center = get_viewport_rect().size / 2
	direction = (screen_center - global_position).normalized()
