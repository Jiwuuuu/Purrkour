extends StaticBody2D

signal gate_opened


var keytaken = false
var in_gate_zone = false

func _ready():
	$AnimationPlayer.play("Idle")

func _on_area_2d_body_entered(body):
	if body is Player:
		if keytaken == false:
			keytaken = true
			$AudioStreamPlayer2D.play()
			$Sprite2D.queue_free()
			await $AudioStreamPlayer2D.finished
			$"../UiManager/KeyIcon".visible = true
			
func _process(delta):
	if keytaken:
		if in_gate_zone:
			if Input.is_action_just_pressed("Enter"):
				print("gate_opened")
				emit_signal("gate_opened")

func _on_gate_zone_body_entered(body):
	if body is Player:
		in_gate_zone = true
		print(in_gate_zone)

func _on_gate_zone_body_exited(body):
	if body is Player:
		in_gate_zone = false
		print(in_gate_zone)
