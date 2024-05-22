extends Node

class_name Damageable

@export var health : float = 50 
	
func hit(damage : int):
	health -= damage
	
	if health <= 0:
		GameManager.respawn_player()


