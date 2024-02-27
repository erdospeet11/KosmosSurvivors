extends Node2D

@onready var tilemap = $tilemap

func _ready():
	#print("Tilemap layer count:", tilemap.get_used_cells(0))
	var tilemap_list = tilemap.get_used_cells(0)
	for element in tilemap_list:
		var tiledata = tilemap.get_cell_tile_data(0, element)
		print(tiledata.get_custom_data("d"))
