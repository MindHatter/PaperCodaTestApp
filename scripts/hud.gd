extends VBoxContainer


func _ready() -> void:
	
	for color in GlobalSettings.color_map.values():
		var label_instance = Label.new()
		label_instance.set_name(color)
		add_child(label_instance)
	var label_instance = Label.new()
	label_instance.set_name("Total")
	add_child(label_instance)


func update(summary) -> void:
	for key in summary:
		get_node(key).text = key + ": " + str(summary[key])
