extends Area2D

class_name Collectable

enum FIRE_TYPE { cold,hot }
export (FIRE_TYPE) var type = FIRE_TYPE.cold
var initial_position: Vector2 = Vector2()

func _ready():
	if type == FIRE_TYPE.cold:
		$ColdFire.emitting = true
	if type == FIRE_TYPE.hot:
		$HotFire.emitting = true
	
	initial_position = position
	

func _on_Collectable_body_entered(body):
	if body.has_method("collect"):
		body.collect(self)

func reset():
	position = initial_position
