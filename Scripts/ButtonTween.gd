extends TextureButton

var SCALE = 0.95
var TRANS = Tween.TRANS_QUINT
var EASE = Tween.EASE_OUT
var TIME = 0.25


func button_tween_in() -> void:
	var tween := create_tween().set_trans(TRANS).set_ease(EASE)
	tween.tween_property(self, "rect_scale", Vector2(SCALE, SCALE), TIME)
	tween.tween_callback(self, "button_tween_out")

func button_tween_out():
	var tween := create_tween().set_trans(TRANS).set_ease(EASE)
	tween.tween_property(self, "rect_scale", Vector2(1, 1), TIME)

func _pressed():
	button_tween_in()
