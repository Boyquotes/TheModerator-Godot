extends ScrollContainer

var VIEW_X
var VIEW_Y
var POS_X
var POS_Y
var viewport

var open : bool = false

func _ready():
	VIEW_X = rect_size.x
	VIEW_Y = rect_size.y
	POS_X = rect_position.x
	POS_Y = rect_position.y
	viewport = get_viewport().get_visible_rect().size
	rect_position = Vector2(POS_X - VIEW_X - 100, POS_Y)
	visible = true

func on_button_press():
	print("button pressed!")
	if open:
		var tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		var tween2 := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "rect_size", Vector2(0, VIEW_Y), 0.75)
		tween2.tween_property(self, "rect_position", Vector2(-rect_size.x, POS_Y), 0.75)
		open = !open
	else:
		var tween := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		var tween2 := create_tween().set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "rect_size", Vector2(VIEW_X, VIEW_Y), 0.75)
		tween2.tween_property(self, "rect_position", Vector2(POS_X, POS_Y), 0.75)
		yield(get_tree().create_timer(0.1), "timeout")
		open = !open


func _on_NotificationDrawerOpen_pressed():
	on_button_press()
