extends Node2D

@export var speed = 150.0
var current_speed = 0.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var spawn_pos = global_position

func _physics_process(delta):
	position.y += current_speed * delta

func _on_hit_box_area_entered(area):
	if area.get_parent() is Player:
		area.get_parent().take_damage(1)
		queue_free()


func _on_player_detect_area_entered(area):
	if area.get_parent() is Player:
		$AnimationPlayer.play("Shake")
		await $AnimationPlayer.animation_finished
		fall()

func fall():
	current_speed = speed
	await get_tree().create_timer(2).timeout
	position = spawn_pos
	current_speed = 0
