extends KinematicBody2D

var score:int = 0

var speed:int = 200
var jumpFoce:int = 900
var gravity:int = 1600

var vel:Vector2 = Vector2(0,0)

onready var sprite: AnimatedSprite = get_node("Sprite")

func _process(delta):
	if vel.x != 0:
		sprite.play("run")
	else:
		sprite.play("idle")
		

func _physics_process(delta):
	#vel.x = 0
	
	if Input.is_action_pressed("move_left1"):
		vel.x = -speed
	elif Input.is_action_pressed("move_right1"):
		vel.x = speed
	else:
		vel.x = 0	
	
	
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	if Input.is_action_just_pressed("jump1") and is_on_floor():
		vel.y -= jumpFoce
		
	
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false

