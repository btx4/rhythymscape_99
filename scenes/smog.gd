extends Sprite2D

@export var sprite_list: Array[Texture2D] = []

func _ready():
	if sprite_list.is_empty():
		return
	texture = sprite_list[randi() % sprite_list.size()]
	scale = Vector2(randf_range(0.03,0.06),randf_range(0.03,0.06))
