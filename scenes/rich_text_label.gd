extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventScript.beat.connect(beat_listener)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func beat_listener(beat: int):
	if beat % 4 == 0:
		text = "[center]3[/center]"
	elif beat % 4 == 1:
		text = "[center]2[/center]"
	elif beat %4 == 2:
		text = "[center]1[/center]"
	else:
		text = "[center]STOMP![/center]"
	
	
