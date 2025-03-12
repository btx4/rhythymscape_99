extends Area2D
var stomps = 0
var mouseIn = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("stomp") and mouseIn:
		stomps += 1
		$"Stomps cooldown".start()
		get_parent().get_node("Stomps").text = str(stomps) + "/5"
		if stomps == 5:
			get_parent().quit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_stomps_cooldown_timeout() -> void:
	stomps = stomps - 1
	$"Stomps cooldown".start()
	get_parent().get_node("Stomps").text = str(stomps) + "/5"
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	mouseIn = true
	$CenterButton.modulate.a = 1
	pass # Replace with function body.


func _on_mouse_exited() -> void:
	mouseIn = false
	$CenterButton.modulate.a = 0.25
	pass # Replace with function body.
