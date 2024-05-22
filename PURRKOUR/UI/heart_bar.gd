extends HBoxContainer

@onready var heartguiclass = preload("res://UI/heart_gui.tscn")

func setmaxhearts(max: int):
	for i in range(max):
		var heart = heartguiclass.instantiate()
		add_child(heart)

func updatehearts(currenthealth : int):
	var hearts = get_children()
	
	for i in range(currenthealth):
		hearts[i].update(true)
		
	for i in range(currenthealth, hearts.size()):
		hearts[i].update(false)
