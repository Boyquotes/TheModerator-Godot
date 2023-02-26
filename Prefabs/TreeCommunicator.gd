extends Tree

var result
var dictionary = {
	"Angel City": "Home sweet home, the city that you live and work in. The city that you grew up in and find yourself staying in despite swearing you were done with it.",
	"Sheriff Vasquez": "The current acting sheriff of Angel County. He is facing a significant amount of controversy for comments he made about the upcoming referendum.", 
	"Moroni": "Despite hearing their name throughout your entire life, you have no clue who they are. They have lots of money and multiple buildings named after them.", 
	"Angel of Death": "The name that the media has ascribed to a serial killer currently on the run. Their signature calling card seems to be killing their victims with a bullet to the neck.", 
	"Board of Supervisors": "The Angel County Board of Supervisors, one of the most powerful political bodies in the county, and an incredibly shady organization.", 
	"referendum": "A process by which an electorate votes on a single political question that has been referred to them for a direct decision."
}
var d_panel

func _ready():
	d_panel = get_parent().get_parent().get_parent().get_parent().get_node("DescriptionPanel/Content")
	connect("item_selected", self, "_on_Context_item_selected")

func _on_Context_item_selected():
	if get_selected() != null:
		result = dictionary[get_selected().get_text(0)]
	else:
		result = ""
	d_panel.text = result
	
