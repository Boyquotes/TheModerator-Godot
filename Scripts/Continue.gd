extends Button

export var scene_name : String

func _on_Button_pressed():
	get_tree().change_scene(scene_name)
