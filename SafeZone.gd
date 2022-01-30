extends Area2D

export (Collectable.FIRE_TYPE) var safe_zone_type = Collectable.FIRE_TYPE.cold


func _on_SafeZone_body_entered(body):
	if body is PlayerBase:
		if safe_zone_type == body.type:
			body.increase_score()
		else:
			body.die()

