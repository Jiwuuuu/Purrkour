extends Node2D



@onready var heartsContainer = $UiManager/HeartBar
@onready var player = $Player

func _ready():
	heartsContainer.setmaxhearts(player.hp)
	heartsContainer.updatehearts(player.hp)
	player.healthChanged.connect(heartsContainer.updatehearts)
	
