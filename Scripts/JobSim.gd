extends Node2D

onready var postText = get_node("Desktop/Center/WindowPanel/Window/Panel/CenterContainer/Post/PostBody")
onready var postName = get_node("Desktop/Center/WindowPanel/Window/VSplitContainer/Name")
onready var likes = get_node("Desktop/Center/WindowPanel/Window/Panel/CenterContainer/Post/LikeIcon/LikeCount")
onready var post = get_node("Desktop/Center/WindowPanel/Window/Panel/CenterContainer/Post")
onready var time = get_node("Desktop/TextureRect/Time")
onready var posterName = get_node("Desktop/Center/WindowPanel/Window/VSplitContainer/Name")
onready var end_of_shift_screen = get_node("ShiftEndPopUp")
onready var junk_drawer = get_node("Desktop/Junk Drawer/Content/TabContainer")
var content
var posts
var postObject : JSONParseResult
var hour: int = 9
var minute: int = 0
var tick: int = 0
var time_format = "%d:%d"
var zero_time_format = "%d:%02d"

# list of first names
var first_names = ["Liam", "Noah", "Oliver", "Elijah", "William", "Olivia", "Emma", "Charlotte", "Amelia", "Ava"]
# list of last names
var last_names = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez", "Martinez"]

func loadJSON() -> void:
	var file = File.new()
	file.open("res://Legacy Posts/deradicalizedPosts.json", File.READ)
	content = file.get_as_text()
	
func parse() -> void:
	postObject = JSON.parse(content)
	if postObject.error:
		print(postObject.error_string)
	else:
		posts = postObject.result

func new_post():
	postText.text = posts.posts[floor(rand_range(0, posts.posts.size()))]
	likes.text = str(floor(rand_range(0, 500)))
	junk_drawer.on_new_post(postText.text)

func new_name():
	var name_format_string = "%s%s %s%s"
	posterName.bbcode_text = name_format_string % ["[center]", first_names[floor(rand_range(0, first_names.size()))], last_names[floor(rand_range(0, last_names.size()))], "[/center]"]

func _ready():
	loadJSON()
	parse()
	postText.text = posts.posts[floor(rand_range(0, posts.posts.size()))]
	# junk_drawer.on_new_post()

func post_fade_in_out():
	post.fade_out()
	yield(get_tree().create_timer(0.8), "timeout")
	print("success!")
	new_post()
	new_name()
	post.fade_in()

func _on_post_ban():
	post_fade_in_out()

func _on_post_keep():
	post_fade_in_out()

func _on_shift_complete():
	end_of_shift_screen.visible = true
	get_tree().paused = true

func _physics_process(delta):
	tick += 1
	if tick % 60 == 0:
		minute += 1
	if minute % 60 == 0 and minute != 0:
		hour += 1
		minute = 0
	var display_hour: int
	if hour <= 12: 
		display_hour = hour
	elif hour > 12:
		display_hour = hour % 12
	if minute < 10:
		time.text = zero_time_format % [display_hour, minute]
	else:
		time.text = time_format % [display_hour, minute]
	if hour > 12:
		hour = 1
	if hour == 5:
		_on_shift_complete()

