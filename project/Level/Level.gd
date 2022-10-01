extends Node2D

func _on_PauseTimer_timeout():
	get_tree().paused = true
