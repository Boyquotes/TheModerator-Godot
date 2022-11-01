extends TextureButton

var SCALE = 0.95

func button_tween_in() -> void:
	var tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "rect_scale", Vector2(SCALE, SCALE), 0.25)
	tween.tween_callback(self, "button_tween_out")

func button_tween_out():
	var tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "rect_scale", Vector2(1, 1), 0.25)

func _pressed():
	button_tween_in()
