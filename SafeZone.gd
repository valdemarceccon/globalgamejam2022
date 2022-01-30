extends Area2D

enum SAFE_ZONE_TYPE { COLD, HOT }

export (SAFE_ZONE_TYPE) var safe_zone_type = SAFE_ZONE_TYPE.COLD


func _on_SafeZone_body_entered(body):
	print(body)
	
	if safe_zone_type == SAFE_ZONE_TYPE.COLD and body is PlayerIce:
		body.increase_score()
	elif safe_zone_type == SAFE_ZONE_TYPE.HOT and body is PlayerFire:
		body.increase_score()
	elif body is PlayerBase:
		body.die()
		

