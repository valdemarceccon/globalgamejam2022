extends Area2D

class_name Collectable

var min_pos = Vector2(64,64)
var max_pos = Vector2(888,360)

enum FIRE_TYPE { cold,hot }
export (FIRE_TYPE) var type = FIRE_TYPE.cold
var initial_position: Vector2 = Vector2()

func pick_random_pos():
	position = Vector2(rand_range(min_pos.x, max_pos.x), rand_range(min_pos.y, max_pos.y))

func _ready():
	randomize()
	if type == FIRE_TYPE.cold:
		$ColdFire.emitting = true
	if type == FIRE_TYPE.hot:
		$HotFire.emitting = true
	pick_random_pos()
	

func _on_Collectable_body_entered(body):
	if body.has_method("collect"):
		body.collect(self)

func reset():
	pick_random_pos()
