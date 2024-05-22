extends Node2D

func _ready():
	$Audio/BgSFX.play()
	
func _on_play_pressed():
	$Audio/StartSFX.play()
	SceneTransition.change_scene_to_file("res://World/world.tscn")

func _on_settings_pressed():
	$Audio/StartSFX.play()
	SceneTransition.change_scene_to_file("res://Menu/settings.tscn")


func _on_about_pressed():
	$Audio/StartSFX.play()
	SceneTransition.change_scene_to_file("res://Menu/about.tscn")


func _on_quit_pressed():
	$Audio/StartSFX.play()
	get_tree().quit()
