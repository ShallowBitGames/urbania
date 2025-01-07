extends Node2D

enum Block {NONE, MIXED, TRENDY, FAMILY, WEALTHY, POOR, TOURIST}

const BLOCK_TYPE = "blocktype"
const POPULATION = "population"

var tile_data : Array

var block_atlas = {
	Block.MIXED: Vector2i(0,1),
	Block.POOR: Vector2i(1,1),
	Block.TRENDY: Vector2i(2,1),
	Block.FAMILY: Vector2i(3,1),
	Block.WEALTHY: Vector2i(4,1),
	Block.TOURIST: Vector2i(5,1)
}

const spread_threshold = 80;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var map_size = $TML_Base.get_used_rect().size
	tile_data.resize(map_size.x)
	for i in tile_data.size():
		tile_data[i] = []
		tile_data[i].resize(map_size.y)
		for j in tile_data[i].size():
			tile_data[i][j] = {BLOCK_TYPE: Block.NONE, POPULATION: 0}
	
#	print(tile_data)
	build_block(Vector2i(0,-1), Block.MIXED, 100)
	build_block(Vector2i(0,0), Block.TRENDY, 215)
#	print(tile_data)


func getPopulation(coords: Vector2i):
	return tile_data[coords.x][coords.y][POPULATION]

func getType(coords: Vector2i):
	return tile_data[coords.x][coords.y][BLOCK_TYPE]

#func getTotalPopulation():
#	pass

func setPopulation(coords: Vector2i, population: int):
	tile_data[coords.x][coords.y][POPULATION] = population

func setType(coords: Vector2i, type):
	tile_data[coords.x][coords.y][BLOCK_TYPE] = type

func _input(event):
	if event.is_action_released("left_click"):
		var clicked_cell = $TML_Base.local_to_map($TML_Base.get_local_mouse_position())
		var position = base_to_build(clicked_cell)
		if !inside_boundaries(position):
			print("outside bounds")
			
		elif $TML_Buildings.get_cell_tile_data(position):
			print("population:")
			print(getPopulation(position))
		
		elif !is_buildable(position):
			print("can't build here")
		
		else:	
			build_block(position,Block.MIXED,100)
		
		spread_blocks()

func spread_blocks():
	var block_positions = $TML_Buildings.get_used_cells()
	
	for coord in block_positions:
		if getPopulation(coord) >= spread_threshold:
			spread_block(coord)


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
	var atlas_coords = block_atlas[type]
	$TML_Buildings.set_cell(coords, 1, atlas_coords)
	
	setPopulation(coords, population)
	setType(coords, type)
	

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
	
	#var type = $TML_Buildings.get_cell_tile_data(position).get_custom_data(BLOCK_TYPE)
	#var orig_population = $TML_Buildings.get_cell_tile_data(position).get_custom_data(POPULATION)
	var type = getType(position)
	var og_population = getPopulation(position)
	var population = og_population / 5
	
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
