extends CanvasLayer

var parent = null

func show():
	$FireScore.show()
	$IceScore.show()

func update_hot(valor):
	$FireScore/Score.text = String(valor)
	
func update_cold(valor):
	$IceScore/Score.text = String(valor)

func winner(win: String):
	$WinnerDisplay.show()
	$WinnerDisplay/Label.text = "Winner %s" % win
	$Button.show()


func _on_Button_pressed():
	if parent:
		parent.reset_game()
		$WinnerDisplay.hide()
		$Button.hide()
