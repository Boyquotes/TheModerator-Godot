extends VBoxContainer
signal completed()

func fade_out() -> void:
	call_deferred("fade_out_tween")


func fade_in() -> void:
	call_deferred("fade_in_tween")


func fade_out_tween() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "modulate", Color(1.0, 1.0, 1.0, 0.0), 0.8)


func fade_in_tween() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "modulate", Color(1.0, 1.0, 1.0, 1.0), 0.8)


