extends Node2D

func _ready():
	var new_dialog = Dialogic.start('Intro')
	add_child(new_dialog)
