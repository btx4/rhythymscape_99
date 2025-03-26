extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventScript.beat.connect(beat_listener)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func beat_listener(beat: int) ->void:
	$AnimationPlayer.play("idle")
	pass
