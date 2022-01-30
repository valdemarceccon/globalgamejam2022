extends Node2D

func _ready():
	$Hud.show()
	$HotPlayer.score_callback = funcref($Hud, "update_hot")
	#$ColdPlayer.score_callback = funcref($Hud, "update_cold")
