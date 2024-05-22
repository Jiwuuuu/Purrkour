extends Control


func _on_restart_pressed():
	$Audio/StartSFX.play()
	SceneTransition.change_scene_to_file("res://World/world.tscn")


func _on_main_menu_pressed():
	$Audio/StartSFX.play()
	SceneTransition.change_scene_to_file("res://Menu/menu.tscn")


func _on_quit_pressed():
	$Audio/StartSFX.play()
	get_tree().quit()
