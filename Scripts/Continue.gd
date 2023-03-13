extends Button

export var scene_name : String

func _on_Button_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
	get_tree().change_scene(scene_name)
