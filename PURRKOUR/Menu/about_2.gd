extends Node2D

func _ready():
	$BgSFX.play()
	$AnimationPlayer.play("slideshow")

func _on_back_pressed():
	$StartSFX.play()
	SceneTransition.change_scene_to_file("res://Menu/menu.tscn")

