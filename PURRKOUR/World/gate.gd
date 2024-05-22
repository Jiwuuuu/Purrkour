extends StaticBody2D

func _on_key_gate_opened():
	SceneTransition.change_scene_to_file("res://finish.tscn")

func _on_gate_zone_area_entered(area):
	if area.get_parent() is Player:
		$Label.visible = true
	
func _on_gate_zone_area_exited(area):
	if area.get_parent() is Player:
		$Label.visible = false
