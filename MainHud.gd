extends CanvasLayer

func show():
	$FireScore.show()
	$IceScore.show()

func update_hot(valor):
	$FireScore/Score.text = String(valor)
	
func update_cold(valor):
	$IceScore/Score.text = String(valor)
