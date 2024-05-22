extends Node2D



func _on_main_menu_pressed():
	SceneTransition.change_scene_to_file("res://Menu/menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
