extends Control

@onready var player = Player
@onready var gameover = $UiManager/GAMEOVER

func _ready():
	$Audio/BgSFX.play()


func set_score(value):
	$ScoreDisplay.text = "Score: " + str(value)

func _on_restart_pressed():
	$Audio/StartSFX.play()
	SceneTransition.change_scene_to_file("res://World/world.tscn")
	GameManager.coins = 0

func _on_main_menu_pressed():
	$Audio/StartSFX.play()
	SceneTransition.change_scene_to_file("res://Menu/menu.tscn")

func _on_quit_pressed():
	$Audio/StartSFX.play()
	get_tree().quit()

func _on_player_killed():
	SceneTransition.change_scene_to_file("res://Menu/gameover.tscn")

