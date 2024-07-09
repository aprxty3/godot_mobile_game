extends ParallaxBackground

@onready var sky = $Sky/Sprite2D

var scroll_speed: int = 200

func _ready():
	sky.texture = load("res://assets/sprites/background-" + str(randi_range(1,2)) + ".png")


func _process(delta):
	scroll_offset.x -= scroll_speed * delta
