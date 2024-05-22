extends Node2D
class_name Coins

var is_collected = false

func _ready():
	$AnimatedSprite2D.play("Idle")

func _on_area_2d_area_entered(_area):
	GameManager.gain_coins(1)
	queue_free()


