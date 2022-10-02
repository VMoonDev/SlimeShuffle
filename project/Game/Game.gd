extends Node2D

var _current_level := 1
var _max_levels := 2

func _ready():
	get_tree().paused = true
	_set_game()

func _on_GameTimer_timeout():
	_current_level += 1
	_set_game()

func _set_game():
	for level in [1, _max_levels, 1]:
		if level == _current_level:
			get_node("Level" + str(_current_level)).visible = true
			get_node("Level" + str(_current_level)).pause_mode = Node.PAUSE_MODE_PROCESS
			get_node("Level" + str(_current_level) + "/Pawn/Camera2D").current = true
		elif level != _current_level:
			get_node("Level" + str(level)).visible = false
			get_node("Level" + str(level)).pause_mode = Node.PAUSE_MODE_STOP
			get_node("Level" + str(level) + "/Pawn/Camera2D").current = false
