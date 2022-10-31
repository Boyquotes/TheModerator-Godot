extends TabContainer

onready var short_term_tab = get_node("Short")
onready var long_term_tab = get_node("Long")
onready var context_tab = get_node("Context")
onready var post_node = get_node("Desktop/Center/WindowPanel/Window/Panel/CenterContainer/Post/PostBody")
var short_term_memory = {}
var long_term_memory = {}
var context = {}
var keywords = ["Angel City", "Sheriff Vasquez", "Moroni", "Angel of Death"]
var long_term_max : int = 5
var short_term_max : int = 15
var current_short_term_amt : int = 0
var current_long_term_amt : int = 0

func on_new_post(post_text):
	# skim post text for keywords
	context_tab.clear()
	for i in keywords:
		var regex = RegEx.new()
		var pattern = "/%s/g" % i
		regex.compile(i)
		var result = regex.search(post_text)
		if result != null:
			var title = context_tab.create_item()
			title.set_text(0, i)

func _on_Short_item_activated():
	# move into long-term memory
	var selected = context_tab.get_selected()
	long_term_tab.create_item(selected)
	selected.free()

func _on_Context_item_activated():
	# move into short-term memory
	print("hi")
	var selected = context_tab.get_selected()
	short_term_tab.create_item(selected)
	selected.free()
