extends KinematicBody2D

var score:int = 0

var speed:int = 200
var jumpFoce:int = 900
var gravity:int = 1600

var move_left: String = "move_left2"
var move_right: String = "move_right2"
var jump: String = "jump2"

var vel:Vector2 = Vector2(0,0)

var colisao_name = "colisao"

onready var sprite: AnimatedSprite = get_node("Sprite")
onready var colisao: CollisionShape2D = get_node(colisao_name)

func scale(ratio: float):
	sprite.transform.x *= ratio 
	sprite.transform.y *= ratio
	colisao.transform.x *= ratio 
	colisao.transform.y *= ratio

func _process(delta):
	if vel.x != 0:
		sprite.play("run")
	else:
		sprite.play("idle")

func _physics_process(delta):
	#vel.x = 0
	
	if Input.is_action_pressed(move_left):
		vel.x = -speed
	elif Input.is_action_pressed(move_right):
		vel.x = speed
	else:
		vel.x = 0	
	
	
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	if Input.is_action_just_pressed(jump) and is_on_floor():
		vel.y -= jumpFoce
		
	
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false

