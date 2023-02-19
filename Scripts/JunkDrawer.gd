extends TabContainer

onready var short_term_tab = get_node("Short")
onready var long_term_tab = get_node("Long")
onready var context_tab = get_node("Context")
onready var post_node = get_node("Desktop/Center/WindowPanel/Window/Panel/CenterContainer/Post/PostBody")
onready var click = get_node("Click")
var short_term_memory = []
var long_term_memory = []
var context = []
var keywords = ["Angel City", "Sheriff Vasquez", "Moroni", "Angel of Death", "Board of Supervisors", "referendum"]
var long_term_max : int = 5
var short_term_max : int = 15
var current_short_term_amt : int = 0
var current_long_term_amt : int = 0
var st_root
var c_root
var lt_root

func _ready():
	st_root = short_term_tab.create_item()
	short_term_tab.set_hide_root(true)
	c_root = context_tab.create_item()
	context_tab.set_hide_root(true)
	lt_root = long_term_tab.create_item()
	long_term_tab.set_hide_root(true)

func create_tree_item(parent, root, title, body):
	var new_item = parent.create_item(root)
	new_item.collapsed = true
	new_item.disable_folding = false
	new_item.set_text(0, title)
	var body_item = parent.create_item(new_item)
	body_item.set_text(0, body)

func on_new_post(post_text):
	# skim post text for keywords
	context_tab.clear()
	context = []
	c_root = context_tab.create_item()
	context_tab.set_hide_root(false)
	for i in keywords:
		var regex = RegEx.new()
		var pattern = "/%s/g" % i
		regex.compile(i)
		var result = regex.search(post_text)
		print(result)
		if result != null and !context.has(i):
			create_tree_item(context_tab, c_root, i, "The world of The Moderator is loosely based on my experience growing up in Orange County, California")
			context.append(i)

func _on_Context_item_activated():
	# move into short-term memory
	var selected = context_tab.get_selected()
	if selected.get_children() != null:
		create_tree_item(short_term_tab, st_root, selected.get_text(0), "The world of The Moderator is loosely based on my experience growing up in Orange County, California")
		click.play()
		selected.free()

func _on_Short_item_activated():
	# move into long-term memory
	var selected = short_term_tab.get_selected()
	if selected.get_children() != null:
		create_tree_item(long_term_tab, lt_root, selected.get_text(0), "The world of The Moderator is loosely based on my experience growing up in Orange County, California")
		click.play()
		selected.free()
