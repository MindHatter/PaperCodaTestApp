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

var blocks_summary = {}


func _ready() -> void:
	for color in GlobalSettings.color_map.values():
		blocks_summary[color] = 0
	blocks_summary["Total"] = 0
	
	var blocks_x = get_viewport().size[0] / 2 - (block_width + blocks_gap) * total_cols / 2
	blocks.position.x = blocks_x + (block_width + blocks_gap) / 2
	_draw_blocks()
	hud.update(blocks_summary)


func _draw_blocks() -> void:
	for col in range(total_cols):
		for row in range(total_rows):
			_create_block(col, row)


func _create_block(col, row) -> void:
	var block_instance = block_scene.instantiate()
	block_instance.position.x = (block_width + blocks_gap) * col
	block_instance.position.y = (block_height + blocks_gap) * row
	blocks.add_child(block_instance)
	block_instance.set_size(block_width, block_height)
	blocks_summary[block_instance.color_map[block_instance.color_number]] += 1


func on_click(color_number) -> void:
	blocks_summary[GlobalSettings.color_map[color_number]] += 1
	if color_number == 1:
		color_number = len(GlobalSettings.color_map)
	else:
		color_number -= 1
	blocks_summary[GlobalSettings.color_map[color_number]] -= 1
	blocks_summary["Total"] += 1
	hud.update(blocks_summary)
