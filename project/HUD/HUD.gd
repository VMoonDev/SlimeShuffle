extends Control

var level setget _set_level

func _set_level(value):
	level = value
	level.connect("time_changed", self, "_on_Game_time_changed")

func _update_timer_label(time):
	$VBoxContainer/Label.text = "Timer: %d" % time
	
func _on_Game_time_changed(new_time):
	_update_timer_label(new_time)
