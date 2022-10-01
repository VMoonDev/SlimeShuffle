extends Node2D

func _on_PauseTimer_timeout():
	get_tree().paused = true
	Global.goto_Scene("res://Level1/Level1.tscn")
