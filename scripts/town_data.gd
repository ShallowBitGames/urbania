extends Node

const BLOCK_TYPE = "blocktype"
const POPULATION = "population"

func getPopulation(coords: Vector2i):
	pass

func getTotalPopulation():
	pass

var tile_data : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var map_size = $TML_Base.get_used_cells().size()
	tile_data.resize(map_size.x)
	for row in population_matrix:
		tile_data[row] = Array()
		tile_data[row].resize(map_size.y)
		tile_data[row].fill({BLOCK_TYPE : })
