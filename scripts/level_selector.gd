extends Node2D

signal change_song
@onready var song_sprites = get_tree().get_nodes_in_group("songs")

var current_song: int = 0
var sprite_index: int = 0
var song_list: Array = ["song1", "song2", "song3", "song4", "song5"]
#change this stuff into the actual song names once we have them, ex: beat_it, take_five, etc.
#using place_holder sprites rn too


@export var beat_it : PackedScene
@export var lacrimosa_requiem : PackedScene
@export var take_five : PackedScene
@export var final_countdown : PackedScene
@export var i_wish : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ProjectSettings.set_setting("display/window/stretch/scale", 0.75)
	
	print(str(ProjectSettings.get_setting("display/window/stretch/scale")))
	song_sprites[sprite_index].visible = true
	#change_song.emit(0)
	print(song_sprites)
	change_song.connect(level_selector)
	level_selector(0, false)

func _process(delta: float) -> void:
	if ($LeftButton/PointLight2D.visible == true) && Input.is_action_just_pressed("stomp"):
		song_sprites[sprite_index].visible = false
		change_level(-1)
		print("change level back")
		$ScrollClick.play()
	if ($RightButton/PointLight2D.visible == true) && Input.is_action_just_pressed("stomp"):
		song_sprites[sprite_index].visible = false
		change_level(1)
		$ScrollClick.play()
		print ("change level forward")
	if ($Start/PointLight2D.visible == true) && Input.is_action_just_pressed("stomp"):
		$Scene_Transition/AnimationPlayer.play("fade_out")
		await get_tree().create_timer(.5).timeout
		$Text/StartQuitText.visible = false
		$Text/SettingsText.visible = false
		level_selector(current_song, true)
		
func change_level(num: int): 
	sprite_index += num
	current_song += num
	if (current_song > 4) || (sprite_index > 4):
		current_song = 0
		sprite_index = 0
	if (current_song < 0) || (sprite_index < 0):
		current_song = 4
		sprite_index = 4
		
	#print(current_song)
	song_sprites[sprite_index].visible = true
	change_song.emit(current_song)
	level_selector(current_song, false)
	

func level_selector(song_num: int, start: bool):
	var song = song_list[song_num]
	print("CURRENT SONG: " + song)
	
	#starting song1
	if (song == "song1"):
		if (start == true):
			if beat_it:
				# Instance the new scene
				var scene_instance = beat_it.instantiate()

				# Replace the current scene
				var current_scene = get_tree().get_current_scene()
				if current_scene:
					current_scene.queue_free()  # Free the current scene

				get_tree().root.add_child(scene_instance)  # Add the new scene to the root
				get_tree().set_current_scene(scene_instance)  # Set it as the current scene
			else:
				print("PackedScene is not set!")
		
	#starting song1
	if (song == "song2"):
		if (start == true):
			if i_wish:
				# Instance the new scene
				var scene_instance = i_wish.instantiate()

				# Replace the current scene
				var current_scene = get_tree().get_current_scene()
				if current_scene:
					current_scene.queue_free()  # Free the current scene

				get_tree().root.add_child(scene_instance)  # Add the new scene to the root
				get_tree().set_current_scene(scene_instance)  # Set it as the current scene
			else:
				print("PackedScene is not set!")
		

	#
#func _on_beat_it_pressed() -> void:
	#if beat_it:
		## Instance the new scene
		#var scene_instance = beat_it.instantiate()
#
		## Replace the current scene
		#var current_scene = get_tree().get_current_scene()
		#if current_scene:
			#current_scene.queue_free()  # Free the current scene
#
		#get_tree().root.add_child(scene_instance)  # Add the new scene to the root
		#get_tree().set_current_scene(scene_instance)  # Set it as the current scene
	#else:
		#print("PackedScene is not set!")


func _on_lacrimosa_requiem_pressed() -> void:
	if lacrimosa_requiem:
		# Instance the new scene
		var scene_instance = lacrimosa_requiem.instantiate()

		# Replace the current scene
		var current_scene = get_tree().get_current_scene()
		if current_scene:
			current_scene.queue_free()  # Free the current scene

		get_tree().root.add_child(scene_instance)  # Add the new scene to the root
		get_tree().set_current_scene(scene_instance)  # Set it as the current scene
	else:
		print("PackedScene is not set!")


func _on_take_5_pressed() -> void:
	if take_five:
		# Instance the new scene
		var scene_instance = take_five.instantiate()

		# Replace the current scene
		var current_scene = get_tree().get_current_scene()
		if current_scene:
			current_scene.queue_free()  # Free the current scene

		get_tree().root.add_child(scene_instance)  # Add the new scene to the root
		get_tree().set_current_scene(scene_instance)  # Set it as the current scene
	else:
		print("PackedScene is not set!")
	pass # Replace with function body.


func _on_beat_it_button_4_pressed() -> void:
	if take_five:
		# Instance the new scene
		var scene_instance = take_five.instantiate()

		# Replace the current scene
		var current_scene = get_tree().get_current_scene()
		if current_scene:
			current_scene.queue_free()  # Free the current scene

		get_tree().root.add_child(scene_instance)  # Add the new scene to the root
		get_tree().set_current_scene(scene_instance)  # Set it as the current scene
	else:
		print("PackedScene is not set!")
	pass # Replace with function body.


func _on_left_hover_area_mouse_entered() -> void:
	#print("MOUSE ENTERED LEFT BUTTON")
	$LeftButton/PointLight2D.visible = true
	$ClickSound.play()

func _on_right_hover_area_mouse_entered() -> void:
	$RightButton/PointLight2D.visible = true
	$ClickSound.play()

func _on_start_hover_area_mouse_entered() -> void:
	$Start/PointLight2D.visible = true
	$ClickSound.play()

func _on_settings_hover_area_mouse_entered() -> void:
	$Settings/PointLight2D.visible = true
	$ClickSound.play()

func _on_quit_hover_area_mouse_entered() -> void:
	$Quit/PointLight2D.visible = true
	$ClickSound.play()


func _on_left_hover_area_mouse_exited() -> void:
	$LeftButton/PointLight2D.visible = false

func _on_right_hover_area_mouse_exited() -> void:
	$RightButton/PointLight2D.visible = false
	
func _on_start_hover_area_mouse_exited() -> void:
	$Start/PointLight2D.visible = false

func _on_settings_hover_area_mouse_exited() -> void:
	$Settings/PointLight2D.visible = false

func _on_quit_hover_area_mouse_exited() -> void:
	$Quit/PointLight2D.visible = false
