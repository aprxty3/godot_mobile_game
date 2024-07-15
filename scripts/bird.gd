extends Area2D

signal gameover

@onready var animate_sprite = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

const JUMP_VELOCITY = -300.0
const ROT_SPEED = 300.0
var velocity : Vector2 = Vector2.ZERO

func _ready():
	random_bird()
	gravity = 500.0
	game_start(false)
	animation_player.play("idle")
	animate_sprite.play()
	

func random_bird():
	var animation = animate_sprite.sprite_frames.get_animation_names()
	print(animation)
	animate_sprite.animation = animation[randi() % animation.size()]

func _process(delta):
	velocity.y += gravity * delta
	
	if rotation_degrees <= 45 and velocity.y > 0:
		rotation_degrees += ROT_SPEED * delta
	elif rotation_degrees >= -45:
			rotation_degrees -= ROT_SPEED * delta
		
	if Input.is_action_just_pressed("tap"):
		velocity.y = JUMP_VELOCITY
		animate_sprite.play()
	
	position += velocity*delta


func _on_body_entered(body):
	animate_sprite.stop()
	gameover.emit()

func game_start(value: bool)->void:
	set_process(value) 
