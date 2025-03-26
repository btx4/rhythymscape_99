extends Node2D


@export var osu_circle_scene : PackedScene
@export var bomb_note_scene : PackedScene

# challenges
@export var fix_the_wire_top_scene : PackedScene
@export var fix_the_wire_bottom_scene : PackedScene
@export var fix_the_wire_left_scene : PackedScene
@export var fix_the_wire_right_scene : PackedScene

@export var poppable_arc_scene : PackedScene
@export var poppable_sine_scene : PackedScene
@export var flipper_scene : PackedScene

@export var attack_start_beat = 20
@export var beats_per_measure = 4
@export var offset = 3

@export var file_path = "res://scenes/Levels/level_layout_files/Beat it 3.23.txt" 

var data_array = []


var total_score = 0
var random_scene
var new_scene
var pop_streak = 0



var last_location

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	EventScript.beat.connect(beat_listener)
	
	if file:
		while not file.eof_reached():
			var line = file.get_line().strip_edges()  # Remove any leading/trailing spaces

			if line.is_empty():
				continue  # Skip empty lines

			line = line.trim_suffix(" :")  # Remove the trailing " :"
			var parts = line.split(",")
			#print(parts)
			print("SIZE PARTS" +str(parts.size()))
			if parts.size() == 11:  # Ensure correct format
				var tuple_data = [int(parts[0]), int(parts[1]), int(parts[2]), int(parts[3]), int(parts[4]), int(parts[5]), int(parts[6]), int(parts[7]), int(parts[8]), int(parts[9]), int(parts[10])]  # Use an array instead of a tuple
				data_array.append(tuple_data)
	else:
		print("Failed to open file.")
	print(data_array)  # Debug: Print the array
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var index2value
func beat_listener(beat: int) ->void:
	#TEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMP
	
	#TEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMPTEMP
	
	#print(data_array[beat])
	if beat % 16 == 4:
		$"Poppable Arc".start()
	
	if beat >= data_array.size():
		print("uhoh")
		return  # Exit early if beat exceeds the array bounds
	#                                                                                                             CIRCLE SPAWN
	print(data_array[beat][1])
	if (data_array[beat][1] == 1):                                   #spawn RANDOM COLOR NOTE
		var beat_color = get_random_color()
		var new_scene = osu_circle_scene.instantiate()
		var circlecolor = randi_range(0,3)
		match circlecolor:
			0:
				new_scene.color = EventScript.GREEN
				new_scene.index = 10
			1:
				new_scene.color = EventScript.YELLOW
				new_scene.index = 0
			2:
				new_scene.color = EventScript.RED
				new_scene.index = 5
			3:
				new_scene.color = EventScript.BLUE
				new_scene.index = 15
		if randi_range(0,9) == 5:
			var bomb_scene = bomb_note_scene.instantiate()
			bomb_scene.index = new_scene.index + 5
			get_parent().add_child(bomb_scene)
		new_scene.circle_popped.connect(self._on_circle_circle_popped)
		new_scene.circle_not_popped.connect(self._on_circle_circle_not_popped)
		get_parent().add_child(new_scene)
	if (data_array[beat][2] == 1):                                   #spawn GREEN NOTE
		var beat_color = get_random_color()
		var new_scene = osu_circle_scene.instantiate()
		new_scene.color = EventScript.GREEN
		new_scene.index = 10
		new_scene.circle_popped.connect(self._on_circle_circle_popped)
		new_scene.circle_not_popped.connect(self._on_circle_circle_not_popped)
		get_parent().add_child(new_scene)
	if (data_array[beat][3] == 1):                                   #spawn YELLOW NOTE
		var beat_color = get_random_color()
		var new_scene = osu_circle_scene.instantiate()
		new_scene.color = EventScript.YELLOW
		new_scene.index = 0
		new_scene.circle_popped.connect(self._on_circle_circle_popped)
		new_scene.circle_not_popped.connect(self._on_circle_circle_not_popped)
		get_parent().add_child(new_scene)
	
	if (data_array[beat][4] == 1):                                   #spawn RED NOTE
		var beat_color = get_random_color()
		var new_scene = osu_circle_scene.instantiate()
		new_scene.color = EventScript.RED
		new_scene.index = 5
		new_scene.circle_popped.connect(self._on_circle_circle_popped)
		new_scene.circle_not_popped.connect(self._on_circle_circle_not_popped)
		get_parent().add_child(new_scene)
		
	if (data_array[beat][5] == 1):                                   #spawn BLUE NOTE
		var beat_color = get_random_color()
		var new_scene = osu_circle_scene.instantiate()
		new_scene.color = EventScript.BLUE
		new_scene.index = 15
		new_scene.circle_popped.connect(self._on_circle_circle_popped)
		new_scene.circle_not_popped.connect(self._on_circle_circle_not_popped)
		get_parent().add_child(new_scene)
	
	if (data_array[beat][9] == 1):
		get_parent().get_node("Spray_paint_minigame_one_screen").spawn_spray_can()
		#print("SPAWN")
	if (data_array[beat][9] == 2):
		#print("SPAWN")
		new_scene = flipper_scene.instantiate()
		get_parent().add_child(new_scene)
	if (data_array[beat][9] == 3):
		new_scene = fix_the_wire_top_scene.instantiate()
		new_scene.position = get_parent().get_node("Pulsing_circle").position
		new_scene.z_index = get_parent().get_node("Pulsing_circle/Background").z_index + 1
		get_parent().add_child(new_scene)
		get_parent().get_node("Pulsing_circle").yellow_hittable = false
	if (data_array[beat][9] == 4):
		new_scene = fix_the_wire_left_scene.instantiate()
		new_scene.position = get_parent().get_node("Pulsing_circle").position
		new_scene.z_index = get_parent().get_node("Pulsing_circle/Background").z_index + 1
		get_parent().add_child(new_scene)
		get_parent().get_node("Pulsing_circle").blue_hittable = false
	if (data_array[beat][9] == 5):
		new_scene = fix_the_wire_right_scene.instantiate()
		new_scene.position = get_parent().get_node("Pulsing_circle").position
		new_scene.z_index = get_parent().get_node("Pulsing_circle/Background").z_index + 1
		get_parent().add_child(new_scene)
		get_parent().get_node("Pulsing_circle").red_hittable = false
		

var COMBO = 1

func _on_circle_circle_popped(quality: int) -> void:
	pop_streak +=1
	
	match(quality):
		3:
			$Combo.text = "[center]" + "PERFECT!" + "[/center]"
			$Combo.modulate.a = 255
			$Combo.start_fade_out()
		2:
			$Combo.text = "[center]" + "GREAT!" + "[/center]"
			$Combo.modulate.a = 255
			$Combo.start_fade_out()
			
		1:
			$Combo.text = "[center]" + "GOOD" + "[/center]"
			$Combo.modulate.a = 255
			$Combo.start_fade_out()
			
		0:
			$Combo.text = "[center]" + "OK" + "[/center]"
			$Combo.modulate.a = 255
			$Combo.start_fade_out()
			
	COMBO = ceil(pop_streak / 10)
	
	total_score = total_score + (pop_streak * COMBO)
	#print(total_score)
	pass # Replace with function body.


func _on_circle_circle_not_popped() -> void:
	print("Missed")
	$Error.play()
	get_parent().start_shake(6,.1)
	pop_streak = 0
	#print("STREAKPOPPED")
	#$Combo.text = "[center]" + str(pop_streak) + "[/center]"
	$XPopUp.modulate.a = 255
	$XPopUp.start_fade_out()
	pass 


func _on_music_conductor_song_over() -> void:
	$Score.text = str(total_score)
	$Score.visible = true
	pass # Replace with function body.
	
func get_random_color() -> Color:
	var type = randi()%4 + 1
	#print(type)
	match type:
		1: #yello
			return EventScript.YELLOW
		2: #red
			return EventScript.RED
		3: #gre
			return EventScript.GREEN
		4: #blu
			return EventScript.BLUE
	return EventScript.RED
