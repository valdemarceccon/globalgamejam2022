extends KinematicBody2D

var score:int = 0

var speed:int = 200
var jumpFoce:int = 700
var gravity:int = 1600
var speep_wall_jump: int = 2000

var move_left: String = "move_left2"
var move_right: String = "move_right2"
var jump: String = "jump2"

var jump_count: int = 0

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
	if is_on_floor() or is_on_wall():
		jump_count = 0
	
	if Input.is_action_pressed(move_left):
		vel.x = -speed
	elif Input.is_action_pressed(move_right):
		vel.x = speed
	else:
		vel.x = 0	
	
	vel = move_and_slide(vel, Vector2.UP)
	
	vel.y += gravity * delta
	if Input.is_action_just_pressed(jump) and (is_on_floor() or jump_count < 1):
		vel.y = -jumpFoce
		if is_on_wall():
			if sprite.flip_h:
				vel.x = speep_wall_jump
				vel = move_and_slide(vel, Vector2.LEFT)
			else:
				vel.x = - speep_wall_jump
				vel = move_and_slide(vel, Vector2.RIGHT)
				
			
		jump_count += 1
		
	
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false

