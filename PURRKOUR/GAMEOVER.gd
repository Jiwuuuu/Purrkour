extends Node2D

func update_score_display():
	$Score/ScoreDisplay.text = str(GameManager.score)
