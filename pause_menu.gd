extends Control

@onready var pause_menu := $"."
@onready var volume_slider := $Volume_Slider

func _ready():
	pause_menu.visible = false  # Hide the menu at the start
	volume_slider.value = db_to_linear(AudioServer.get_bus_volume_db(0)) * 100
	volume_slider.value_changed.connect(_on_volume_changed)

func toggle_pause():
	get_tree().paused = !get_tree().paused
	pause_menu.visible = get_tree().paused  # Show menu only when paused

func _on_resume_pressed():
	toggle_pause()

func _on_restart_pressed():
	print("Bing")
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Levels/level_selector.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_volume_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value / 100.0))


func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value / 100.0))
	pass # Replace with function body.
