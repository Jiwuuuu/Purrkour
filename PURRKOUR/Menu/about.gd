extends Node2D

func _ready():
	$BgSFX.play()

func _on_back_pressed():
	$StartSFX.play()
	SceneTransition.change_scene_to_file("res://Menu/menu.tscn")


func _on_inspiration_pressed():
	$StartSFX.play()
	SceneTransition.change_scene_to_file("res://Menu/about_2.tscn")
