extends CanvasLayer
class_name manager

func _ready():
	GameManager.gained_coins.connect(update_coin_display)

func update_coin_display():
	$CoinDisplay.text = str(GameManager.coins)
