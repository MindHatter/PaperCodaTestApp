extends Node2D

@onready var block_scene = preload("res://scenes/block.tscn")
@onready var blocks = $Blocks
@onready var hud = $HUD

# Grid setup
@export var total_cols = 4
@export var total_rows = 3
@export var block_width = 200
@export var block_height = 100
@export var blocks_gap = 50

var clicks

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clicks = {
		"red": 0,
		"black": 0,
		"blue": 0,
		"total": 0
	}
	var blocks_x = get_viewport().size[0] / 2 - (block_width + blocks_gap) * total_cols / 2
	blocks.position.x = blocks_x + (block_width + blocks_gap) / 2
	_draw_blocks()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _draw_blocks():
	for col in range(total_cols):
		for row in range(total_rows):
			_create_block(col, row)


func _create_block(col, row):
	var block_instance = block_scene.instantiate()
	block_instance.position.x = (block_width + blocks_gap) * col
	block_instance.position.y = (block_height + blocks_gap) * row
	blocks.add_child(block_instance)
	block_instance.set_size(block_width, block_height)

func on_click(color):
	clicks[color] += 1
	clicks["total"] += 1
	hud.get_node(color.capitalize()).text = color.capitalize() + ": " + str(clicks[color])
	hud.get_node("Total").text = "Total: " + str(clicks["total"])
