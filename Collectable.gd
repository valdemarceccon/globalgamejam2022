extends Area2D

class_name Collectable

enum FIRE_TYPE { cold,hot }
export (FIRE_TYPE) var type = FIRE_TYPE.cold
var body = null
var initial_position: Vector2 = Vector2()

func _ready():
	if type == FIRE_TYPE.cold:
		$ColdFire.emitting = true
	if type == FIRE_TYPE.hot:
		$HotFire.emitting = true
	
	initial_position = position
	

func _on_Collectable_body_entered(body):
	if body.has_method("collect"):
		self.body = body
		body.collect(self)

func score(safe_zone):
	safe_zone.score(self)
	self.body.increase_score()

func reset():
	print("should reset")
	position = initial_position
