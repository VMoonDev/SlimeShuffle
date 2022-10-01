extends Node2D


func _ready():
	$Level2.visible = false
	Global.goto_Scene("res://Level1/Level1.tscn")


func _on_GameTimer_timeout():
	Global.goto_Scene("res://Level2/Level2.tscn")
