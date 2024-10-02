extends Area2D

@export var block_width = 20
@export var block_height = 10

var color_number
var color_map = {
	0: "red",
	1: "black",
	2: "blue"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_number = range(len(color_map)).pick_random()
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


