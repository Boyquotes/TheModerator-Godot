extends PanelContainer

onready var title = get_node("VBoxContainer/Header")
onready var body = get_node("VBoxContainer/Body")
var panel_margins:int = 10
var time_limit:float = 1.0
var is_in_notif_drawer:bool = true

signal notif_exit

func init(new_title: String, new_body: String, is_static: bool):
	title.text = new_title
	body.text = new_body
	is_in_notif_drawer = is_static

func set_title(new_title:String):
	title.text = new_title

func set_body(new_body:String):
	body.text = new_body

func _ready():
	margin_left += panel_margins
	margin_right -= panel_margins
	margin_top += panel_margins
	margin_bottom -= panel_margins
	rect_position.x -= (rect_size.x + 100)
