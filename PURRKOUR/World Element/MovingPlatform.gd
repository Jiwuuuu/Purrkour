extends Node2D

var moving = false

func _physics_process(_delta):
	moving = true
	$AnimatableBody2D/AnimationPlayer.play("Moving")
