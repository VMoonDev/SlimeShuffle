extends Area2D

var player

func _on_Node2D_body_entered(body):
	$PowerTimer.start()
	body.wall_jump_max_set(50)
	player = body


func _on_PowerTimer_timeout():
	player.wall_jump_max_set(3)
	queue_free()
