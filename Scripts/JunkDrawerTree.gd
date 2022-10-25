extends Tree


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var children = []
var items:int = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	# load button texture
	var button = load("res://Materials/Buttons/OrangeButtonDown.tres")
	# create fake root
	var root = create_item()
	set_hide_root(true)
	var i:int = 0
	while i < items:
		i += 1
		var child = create_item(root)
		child.set_text(0, "Child %d" % i)
		children.append(child)
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
