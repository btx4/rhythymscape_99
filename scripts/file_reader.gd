extends Node2D

var file_path = "res://scenes/Levels/level_layout_files/Beat it 1.txt" 
var file = FileAccess.open(file_path, FileAccess.READ)

var data_array = []

func _ready() -> void:
	if file:
		while not file.eof_reached():
			var line = file.get_line().strip_edges()  # Remove any leading/trailing spaces

			if line.is_empty():
				continue  # Skip empty lines

			line = line.trim_suffix(" :")  # Remove the trailing " :"
			var parts = line.split(",")

			if parts.size() == 3:  # Ensure correct format
				var tuple_data = [int(parts[0]), int(parts[1]), int(parts[2])]  # Use an array instead of a tuple
				data_array.append(tuple_data)
	else:
		print("Failed to open file.")
	print(data_array)  # Debug: Print the array

func _process(delta: float) -> void:
	pass
	
