extends Node2D

@onready var tilemap = $tilemap
@onready var portal = preload("res://portal.tscn")

var custom_data_tile_list = []

func _ready():
	#print("Tilemap layer count:", tilemap.get_used_cells(0))
	var tilemap_list = tilemap.get_used_cells(0)
	for element in tilemap_list:
		var tiledata = tilemap.get_cell_tile_data(0, element)
		if tiledata.get_custom_data("d"):
			custom_data_tile_list.append(element)	
		#print(tilemap.map_to_local(element))

func _process(delta):
	if Input.is_action_just_pressed("spawn portal"):
		var newPortal = portal.instantiate()
		if newPortal != null:
			var rand_index:int = randi() % custom_data_tile_list.size()
			print(rand_index)
			print(custom_data_tile_list[rand_index])
			newPortal.position = tilemap.map_to_local(custom_data_tile_list[rand_index])
			add_child(newPortal)

