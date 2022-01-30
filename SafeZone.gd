extends Area2D

enum SAFE_ZONE_TYPE { COLD, HOT }

export (SAFE_ZONE_TYPE) var safe_zone_type = SAFE_ZONE_TYPE.COLD


func _on_SafeZone_body_entered(body):
	print(body)
	if body.has_method("increase_score"):
		body.increase_score()
