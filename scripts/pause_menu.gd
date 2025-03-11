extends Node2D

@onready var pause_menu := $"."
@onready var volume_slider = $VolumeSlider

func _ready():
	
	#$SubViewportContainer/SubViewport.size_2d_override = Vector2i(1920, 1080) # Custom size for 2D.
	#$SubViewportContainer/SubViewport.size_2d_override_stretch = true # Enable stretch for custom size.
	#pause_menu.visible = false  # Hide the menu at the start
	volume_slider.value = db_to_linear(AudioServer.get_bus_volume_db(0)) * 100
	volume_slider.value_changed.connect(_on_volume_changed)

func _process(delta: float) -> void:
	if ($Quit/PointLight2D.visible == true) && Input.is_action_just_pressed("stomp"):
		print("quit -> nav to start level menu")
		get_tree().paused = false
		get_tree().change_scene_to_file("res://scenes/Levels/level_selector.tscn")
	if ($Resume/PointLight2D.visible == true) && Input.is_action_just_pressed("stomp"):
		print("resume -> nav back to level")
		toggle_pause()
		$AudioStreamPlayer2D.stop()
	if ($Restart/PointLight2D.visible == true) && Input.is_action_just_pressed("stomp"):
		print("restart -> nav to beginning of level")
		get_tree().paused = false
		get_tree().reload_current_scene()

func toggle_pause():
	visible = true
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused  # Show menu only when paused

#func _on_quit_pressed():
	#get_tree().quit()

func _on_volume_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value / 100.0))

func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value / 100.0))
	pass # Replace with function body.
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):  # Typically "ESC"
		print("PAUSE PRESSED")
		pause_menu.toggle_pause()
		$AudioStreamPlayer2D.play()


func _on_quit_hover_area_mouse_entered() -> void:
	print("MOUSE ENTERED QUIT BUTTON")
	$Quit/PointLight2D.visible = true
	
func _on_resume_hover_area_mouse_entered() -> void:
	$Resume/PointLight2D.visible = true
	
func _on_restart_hover_area_mouse_entered() -> void:
	$Restart/PointLight2D.visible = true


func _on_quit_hover_area_mouse_exited() -> void:
	$Quit/PointLight2D.visible = false

func _on_resume_hover_area_mouse_exited() -> void:
	$Resume/PointLight2D.visible = false

func _on_restart_hover_area_mouse_exited() -> void:
	$Restart/PointLight2D.visible = false
