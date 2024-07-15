extends Node2D

var Pipes: = preload("res://scenes/pipes.tscn")

var score = 0

func _on_timer_timeout():
	var pipe =  Pipes.instantiate()
	pipe.position.y = randi_range(-260, 142)
	pipe.update_score.connect(add_score)
	add_child(pipe)
	
func add_score() -> void:
	score += 1
	print(score)
