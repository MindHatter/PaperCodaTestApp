extends Area2D

@export var block_width = 20
@export var block_height = 10

var color_number
var color_map = {
	1: "red",
	2: "black",
	3: "blue"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_number = range(1, len(color_map) + 1).pick_random()
	set_size(block_width, block_height)
	update_color()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_size(width, height):
	$Sprite2D.texture.set_size(Vector2(width, height))
	$CollisionShape2D.shape.set_size(Vector2(width, height))
	
func update_color():
	$Sprite2D.set_self_modulate(Color(color_map[color_number]))




func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed():
		if color_number == len(color_map):
			color_number = 1
		else:
			color_number += 1
		print(color_number)
		update_color()
