extends Node2D

@export var triangle_scene : PackedScene
@export var sine_scene : PackedScene
@export var circle_scene : PackedScene
@export var osu_circle_scene : PackedScene
@export var smog_scene : PackedScene

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
	if beat == 332:
		new_scene = smog_scene.instantiate()
		get_parent().add_child(new_scene)
	if beat % 4 == 3  and beat > 20:
		if beat < 332 or beat > 340:
			new_scene = osu_circle_scene.instantiate()
			new_scene.position.x = randi() % 160
			new_scene.position.y = randi() % 180
			new_scene.target_beat = beat + 5
			
			new_scene.circle_popped.connect(self._on_circle_circle_popped)
			new_scene.circle_not_popped.connect(self._on_circle_circle_not_popped)
			
			add_child(new_scene)
		
		
	if beat % 32 == 0 and 1 == 2:
		random_scene = randi()%3
		match random_scene:
			0:
				new_scene = triangle_scene.instantiate()
				new_scene.beat_start = beat
				add_child(new_scene)
				pass
			1:
				new_scene = circle_scene.instantiate()
				new_scene.beat_start = beat
				add_child(new_scene)
				pass
			2:
				new_scene = sine_scene.instantiate()
				new_scene.beat_start = beat
				add_child(new_scene)
				pass
	pass
var COMBO = 1

func _on_circle_circle_popped() -> void:
	pop_streak +=1
	print("STREAKBOOST")
	$Combo.text = "[center]" + str(pop_streak) + "[/center]"
	$Combo.modulate.a = 255
	$Combo.start_fade_out()
	
	COMBO = ceil(pop_streak / 10)
	
	total_score = total_score + (pop_streak * COMBO)
	print(total_score)
	pass # Replace with function body.


func _on_circle_circle_not_popped() -> void:
	get_parent().start_shake(6,.1)
	pop_streak = 0
	print("STREAKPOPPED")
	$Combo.text = "[center]" + str(pop_streak) + "[/center]"
	$Combo.modulate.a = 255
	$Combo.start_fade_out()
	pass # Replace with function body.


func _on_music_conductor_song_over() -> void:
	$Score.text = str(total_score)
	$Score.visible = true
	pass # Replace with function body.
