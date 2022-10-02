extends Node2D


func _ready():
	get_tree().paused = true
	get_node("Level2").visible = false
	get_node("Level1").pause_mode = Node.PAUSE_MODE_PROCESS
	get_node("Level1/Pawn/Camera2D").current = true


func _on_GameTimer_timeout():
	get_node("Level1").visible = false
	get_node("Level2").visible = true
	get_node("Level1").pause_mode = Node.PAUSE_MODE_STOP
	get_node("Level2").pause_mode = Node.PAUSE_MODE_PROCESS
	get_node("Level1/Pawn/Camera2D").current = false
	get_node("Level2/Pawn/Camera2D").current = true
