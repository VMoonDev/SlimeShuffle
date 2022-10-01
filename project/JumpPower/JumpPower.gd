extends Area2D


func _on_Node2D_body_entered(body):
	if body.is_in_group("Player"):
		body.wall_jump_max = 20
