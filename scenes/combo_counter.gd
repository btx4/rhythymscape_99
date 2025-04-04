extends RichTextLabel

func _ready() -> void:
	EventScript.add_points.connect(_on_add_points) # Ensure EventScript has this signal

func _on_add_points(num_points: int):
	print("Points added: ", num_points) # Replace with actual logic
	text = str(text.to_int() + num_points)
	EventScript.updating_points(text.to_int())
	#print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA -> combo_points")
	#print(text)
	print("WEE")
