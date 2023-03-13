extends Control

func _on_Continue_pressed():
	visible = false
	get_tree().paused = false
