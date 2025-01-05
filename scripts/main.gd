extends Node2D


enum Block {MIXED, TRENDY, FAMILY, WEALTHY, POOR, TOURIST}

const BLOCK_TYPE = "block_type"
const POPULATION = "population"

const block_atlas = {
	Block.MIXED: Vector2i(0,1),
	Block.POOR: Vector2i(1,1),
	Block.TRENDY: Vector2i(2,1),
	Block.FAMILY: Vector2i(3,1),
	Block.WEALTHY: Vector2i(4,1),
	Block.TOURIST: Vector2i(5,1)
}

var population_matrix

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var map_size = $TML_Base.get_used_cells().size()
	
	population_matrix.resize(map_size[0])
	for row in population_matrix:
		population_matrix[row] = Array()
		population_matrix[row].resize(map_size[1])
		population_matrix[row].fill(0)
	
	build_block(Vector2i(1,-1), Block.MIXED, 100)
	build_block(Vector2i(0,-2), Block.TRENDY, 215)

func _input(event):
	if event.is_action_released("left_click"):
		var clicked_cell = $TML_Base.local_to_map($TML_Base.get_local_mouse_position())
		var position = base_to_build(clicked_cell)
		if !inside_boundaries(position):
			print("outside bounds")
		elif $TML_Buildings.get_cell_tile_data(position):
			#spread_block(position)
			print("already a block here:")
			
			print($TML_Buildings.get_cell_tile_data(position))
			
			var block_type = $TML_Buildings.get_cell_tile_data(position).get_custom_data(BLOCK_TYPE)
			print("type:")
			print(block_type)
			
			var population = $TML_Buildings.get_cell_tile_data(position).get_custom_data(POPULATION)
			print("population:")
			print(population)
			#$TML_Buildings.set_cell(clicked_cell, 1, Vector2i(0,0))
		elif !is_buildable(position):
			print("can't build here")
		else:	
			$TML_Buildings.set_cell(position, 1, Vector2i(0,0))

func spread_blocks():

	var block_positions = $TML_Buildings.get_used_cells()
	for vec in block_positions:
		print(vec)
	


func base_to_build(coordinates: Vector2i) -> Vector2i:
	return Vector2i(coordinates[0]-1, coordinates[1]-1)

func build_to_base(coordinates: Vector2i) -> Vector2i:
	return Vector2i(coordinates[0]+1, coordinates[1]+1)

func inside_boundaries(coord: Vector2i) -> bool:
	var board = $TML_Base.get_used_rect()
	return board.has_point(build_to_base(coord))

func is_buildable(coord: Vector2i) -> bool:
	var base_coord = build_to_base(coord)
	var tile_atlas_coords = $TML_Base.get_cell_atlas_coords(base_coord)
	return tile_atlas_coords != Vector2i(0,0)

func build_block(coords: Vector2i, type, population: int):
	print("build block called")
	print("type passed:")
	print(type)
	print("population passed:")
	print(population)
	
	var atlas_coords = block_atlas[type]
	
	$TML_Buildings.set_cell(coords, 1, atlas_coords)
	
	population_matrix[coords.x][coords.y] = population
	

func spread_block(position: Vector2i) -> bool:
	# get four adjoining squares
	# check if on board + free + base is buildable
	var x = position[0]
	var y = position[1]
	
	var surrounding = []
	for coord in [Vector2i(x-1, y), Vector2i(x+1, y), Vector2i(x, y-1), Vector2i(x, y+1)]:
		if inside_boundaries(coord): 
			if !$TML_Buildings.get_cell_tile_data(coord):
				if is_buildable(coord):
					surrounding.append(coord)
	
	if surrounding.is_empty():
		return false
	
	var type = $TML_Buildings.get_cell_tile_data(position).get_custom_data(BLOCK_TYPE)
	var orig_population = $TML_Buildings.get_cell_tile_data(position).get_custom_data(POPULATION)
	
	var population = orig_population / 5
	
	# get free space with maximum attractiveness
	# create new block of same type and 20% population
	build_block(surrounding[0], type, population)
	
	return true


#func pass_turn():
	# draw cards
	# handle player action
#	while !player_action():
#		pass	
	
	# recalculate?
	# spread
#	spread_blocks()
	
	# recalculate?
