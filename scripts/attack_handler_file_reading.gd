extends Node2D


@export var osu_circle_scene : PackedScene
@export var follow_the_wire_scene : PackedScene
@export var follow_the_wire_zigzag_scene : PackedScene

# challenges
@export var back_and_forth_challenge_scene : PackedScene
@export var smog_scene : PackedScene
@export var charge_up_challenge_scene : PackedScene
@export var poppable_arc_scene : PackedScene
@export var poppable_sine_scene : PackedScene

@export var attack_start_beat = 20
@export var beats_per_measure = 4
@export var offset = 3

var file_path = "res://scenes/Levels/level_layout_files/Beat it 2.txt" 
var file = FileAccess.open(file_path, FileAccess.READ)

var data_array = []

var WHITE = Color(1,1,1)
var YELLOW = Color(1,1,0)
var RED = Color(1,0,0)
var GREEN = Color(0,1,0)
var BLUE = Color(0,0,1)

var total_score = 0
var random_scene
var new_scene
var pop_streak = 0



var last_location

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventScript.beat.connect(beat_listener)
	
	if file:
		while not file.eof_reached():
			var line = file.get_line().strip_edges()  # Remove any leading/trailing spaces

			if line.is_empty():
				continue  # Skip empty lines

			line = line.trim_suffix(" :")  # Remove the trailing " :"
			var parts = line.split(",")

			if parts.size() == 4:  # Ensure correct format
				var tuple_data = [int(parts[0]), int(parts[1]), int(parts[2])]  # Use an array instead of a tuple
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
	#print(data_array[beat])
	if beat >= data_array.size():
		print("uhoh")
		return  # Exit early if beat exceeds the array bounds
	
	#                                                                                                             CIRCLE VS FOLLOW WIRE
	print(data_array[beat][1])
	
	if (data_array[beat][1] == 1):
		new_scene = osu_circle_scene.instantiate()
		new_scene.position.x = randi() % 160
		new_scene.position.y = randi() % 180
		new_scene.target_beat = beat + 9
		var beat_color = get_random_color()
		new_scene.myColor = beat_color
		
		
		get_parent().get_node("Pulsing_circle").targetBeat.append([beat + 9,beat_color])
		new_scene.circle_popped.connect(self._on_circle_circle_popped)
		new_scene.circle_not_popped.connect(self._on_circle_circle_not_popped)
		add_child(new_scene)
	elif (data_array[beat][1] == 2):
		print("in here")
		new_scene = follow_the_wire_scene.instantiate()
		new_scene.position.x = 0
		new_scene.position.y = 0
		new_scene.start_circle_target_beat = beat + 9
		
		new_scene.end_circle_target_beat = beat + 9 + beats_per_measure
		var beat_color = get_random_color()
		get_parent().get_node("Pulsing_circle").targetBeat.append([beat + 9,beat_color])
		get_parent().get_node("Pulsing_circle").targetBeat.append([beat + 9 + beats_per_measure,beat_color])
		new_scene.circle_color = beat_color
		get_parent().add_child(new_scene)
	elif (data_array[beat][1] == 3):
		get_parent().get_node("Poppable Arc").start()
		print("Got Here [3]")
	elif (data_array[beat][1] == 4):
		print("Got Here (4)")
		get_parent().get_node("poppable sine").start()
		
	
	#                                                                                                              CHALLENGES
	index2value = data_array[beat][2]
	
	if (index2value == -1):
		index2value = randi_range(1,4)
	if (index2value == 1):
		get_parent().get_node("Spray_paint_minigame").spawn_spray_can()
	elif(index2value == 2):
		get_parent().get_node("boom_box_challenge")._spawn_boom_box()
		get_parent().get_node("boom_box_challenge")._spawn_boom_box()
		get_parent().get_node("boom_box_challenge")._spawn_boom_box()
		get_parent().get_node("boom_box_challenge")._spawn_boom_box()
		get_parent().get_node("boom_box_challenge")._spawn_boom_box()
	elif (index2value == 3):
		new_scene = back_and_forth_challenge_scene.instantiate()
		new_scene.position.x = 0
		new_scene.position.y = 0
		get_parent().add_child(new_scene)
	elif (index2value == 4):
		new_scene = charge_up_challenge_scene.instantiate()
		new_scene.position.x = 0
		new_scene.position.y = 0
		get_parent().add_child(new_scene)
var COMBO = 1

func _on_circle_circle_popped(quality: int) -> void:
	print("HOORAY")
	pop_streak +=1
	
	match(quality):
		3:
			$Combo.text = "[center]" + "Perfect!" + "[/center]"
			$Combo.modulate.a = 255
			$Combo.start_fade_out()
			
			$Combo2.text = "[center]" + "Perfect!" + "[/center]"
			$Combo2.modulate.a = 255
			$Combo2.start_fade_out()
		2:
			$Combo.text = "[center]" + "Great!" + "[/center]"
			$Combo.modulate.a = 255
			$Combo.start_fade_out()
			
			$Combo2.text = "[center]" + "Great!" + "[/center]"
			$Combo2.modulate.a = 255
			$Combo2.start_fade_out()
		1:
			$Combo.text = "[center]" + "Good" + "[/center]"
			$Combo.modulate.a = 255
			$Combo.start_fade_out()
			
			$Combo2.text = "[center]" + "Good" + "[/center]"
			$Combo2.modulate.a = 255
			$Combo2.start_fade_out()
		0:
			$Combo.text = "[center]" + "Ok" + "[/center]"
			$Combo.modulate.a = 255
			$Combo.start_fade_out()
			
			$Combo2.text = "[center]" + "Ok" + "[/center]"
			$Combo2.modulate.a = 255
			$Combo2.start_fade_out()
	
	COMBO = ceil(pop_streak / 10)
	
	total_score = total_score + (pop_streak * COMBO)
	#print(total_score)
	pass # Replace with function body.


func _on_circle_circle_not_popped() -> void:
	$Error.play()
	get_parent().start_shake(6,.1)
	pop_streak = 0
	#print("STREAKPOPPED")
	#$Combo.text = "[center]" + str(pop_streak) + "[/center]"
	$XPopUp.modulate.a = 255
	$XPopUp.start_fade_out()
	pass # Replace with function body.


func _on_music_conductor_song_over() -> void:
	$Score.text = str(total_score)
	$Score.visible = true
	pass # Replace with function body.
	
func get_random_color() -> Color:
	var type = randi()%5 + 1
	#print(type)
	match type:
		1:
			return YELLOW
		2: 
			return RED
		3: 
			return GREEN
		4:
			return BLUE
		5:
			return WHITE
			
	return RED
