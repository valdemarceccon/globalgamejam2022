extends Node2D

export var win_score = 1
var playing = true

func _ready():
	$Hud.show()
	$Hud.parent = self
	$HotPlayer.score_callback = funcref($Hud, "update_hot")
	$ColdPlayer.score_callback = funcref($Hud, "update_cold")
	$HotPlayer.other = $ColdPlayer
	$ColdPlayer.other = $HotPlayer

func _process(delta):
	if playing:
		if $HotPlayer.score >= win_score:
			$Hud.winner("fire")
			playing = false
		elif $ColdPlayer.score >= win_score:
			$Hud.winner("ice")
			playing = false

func reset_game():
	$HotPlayer.score = 0
	$ColdPlayer.score = 0
	$HotPlayer.die()
	$ColdPlayer.die()
	$Hud.update_hot(0)
	$Hud.update_cold(0)
	playing = true
