extends Node2D

@export var triangle_scene : PackedScene
@export var sine_scene : PackedScene
@export var circle_scene : PackedScene
@export var osu_circle_scene : PackedScene
@export var smog_scene : PackedScene
@export var follow_the_wire_scene : PackedScene

@export var attack_start_beat = 20
@export var beats_per_measure = 4
@export var offset = 3


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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func beat_listener(beat: int) ->void:
	if beat == 15 or beat == 45:
		new_scene = follow_the_wire_scene.instantiate()
		new_scene.position.x = 0
		new_scene.position.y = 0
		new_scene.start_circle_target_beat = beat + 9
		
		new_scene.end_circle_target_beat = beat + 9 + beats_per_measure
		var beat_color = get_random_color()
		get_parent().get_node("Pulsing_circle").targetBeat.append([beat + 9,beat_color])
		get_parent().get_node("Pulsing_circle").targetBeat.append([beat + 9 + beats_per_measure,beat_color])
		new_scene.circle_color = beat_color
		#print("adding_child")
		add_child(new_scene)
	if beat % (beats_per_measure * 4) == 0 and true == false:
		match randi()%2:
			0:
				get_parent().get_node("Spray_paint_minigame").spawn_spray_can()
			1:
				get_parent().get_node("boom_box_challenge")._spawn_boom_box()
	if beat % beats_per_measure == offset  and beat > attack_start_beat and true == false:
		new_scene = osu_circle_scene.instantiate()
		new_scene.position.x = randi() % 160
		new_scene.position.y = randi() % 180
		new_scene.target_beat = beat + 9
		var beat_color = get_random_color()
		new_scene.myColor = beat_color
		
		
		get_parent().get_node("Pulsing_circle").targetBeat.append([beat + 9,beat_color])
		new_scene.circle_popped.connect(self._on_circle_circle_popped)
		new_scene.circle_not_popped.connect(self._on_circle_circle_not_popped)
		#print("adding_child")
		add_child(new_scene)
	pass
var COMBO = 1

func _on_circle_circle_popped() -> void:
	pop_streak +=1
	#print("STREAKBOOST")
	$Combo.text = "[center]" + str(pop_streak) + "[/center]"
	$Combo.modulate.a = 255
	$Combo.start_fade_out()
	
	COMBO = ceil(pop_streak / 10)
	
	total_score = total_score + (pop_streak * COMBO)
	print(total_score)
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
	var type = randi()%4 + 1
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
			
	return RED
