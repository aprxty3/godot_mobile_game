extends CharacterBody2D

signal update_score

const pipe_type = ["res://assets/sprites/pipe-green.png", "res://assets/sprites/pipe-red.png"]
@onready var top_pipe = $top_pipe
@onready var bottom_pipe = $bottom_pipe

const SPEED = -150.0

func _ready():
	var random_pipe = pipe_type[(randi() % pipe_type.size())]
	top_pipe.get_node("Sprite2D").texture = load(random_pipe) 
	bottom_pipe.get_node("Sprite2D").texture = load(random_pipe)
	velocity = Vector2(SPEED, 0)

func _physics_process(delta):
	move_and_collide(velocity * delta)
	
func _on_screen_exited():
	Disable_Shape(top_pipe)
	Disable_Shape(bottom_pipe)
	queue_free()

func Disable_Shape(shape: Node) -> void:
	shape.set_deferred("disable", true)


func _on_area_2d_area_exited(area):
	update_score.emit()
