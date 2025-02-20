extends Node

enum Block {NONE, MIXED, TRENDY, FAMILY, WEALTHY, POOR, TOURIST}

enum Card {CLINIC, LIBRARY, PARK}

enum BlockData {
	BLOCK_TYPE,
	POPULATION,
	QOL,
	APPEAL
}

#const BLOCK_TYPE = "blocktype"
#const POPULATION = "population"

var tile_data : Array

var deck = [Card.CLINIC, Card.LIBRARY, Card.PARK, Card.PARK, Card.PARK, Card.PARK]

var block_atlas = {
	Block.MIXED: Vector2i(0,1),
	Block.POOR: Vector2i(1,1),
	Block.TRENDY: Vector2i(2,1),
	Block.FAMILY: Vector2i(3,1),
	Block.WEALTHY: Vector2i(4,1),
	Block.TOURIST: Vector2i(5,1)
}

const spread_threshold = 80;

@onready var hand = $Hand

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var map_size = $TML_Base.get_used_rect().size
	tile_data.resize(map_size.x)
	for i in tile_data.size():
		tile_data[i] = []
		tile_data[i].resize(map_size.y)
		for j in tile_data[i].size():
			tile_data[i][j] = {}
			tile_data[i][j][BlockData.BLOCK_TYPE] = Block.NONE
			tile_data[i][j][BlockData.POPULATION] = 0
			tile_data[i][j][BlockData.QOL] = 0
			tile_data[i][j][BlockData.APPEAL] = 0
			
			#tile_data[i][j] = {BLOCK_TYPE: Block.NONE, POPULATION: 0}
	
#	print(tile_data)
	build_block(Vector2i(0,-1), Block.MIXED, 100)
	build_block(Vector2i(0,0), Block.TRENDY, 215)
#	print(tile_data)
	
	#hand = []
	#draw_stone()
	#draw_stone()
	#draw_stone()
	

func _process(delta: float) -> void:
	var mouse_pos = $TML_Base.local_to_map($TML_Base.get_local_mouse_position())
	var position = base_to_build(mouse_pos)
	
	if inside_boundaries(position):
		$TML_Buildings.get_cell_tile_data(position)
		var bd = getBlockDataAll(position)
		$txt_stats.showInfo(position, bd[BlockData.POPULATION], 
							bd[BlockData.QOL], bd[BlockData.APPEAL])

func getBlockDataAll(coords: Vector2i):
	return tile_data[coords.x][coords.y]

func getBlockData(coords: Vector2i, datatype):
	return tile_data[coords.x][coords.y][datatype]

func setBlockData(coords: Vector2i, datatype, value: int):
	tile_data[coords.x][coords.y][datatype] = value

func _input(event):
	
	if event.is_action_released("left_click"):
		var clicked_cell = $TML_Base.local_to_map($TML_Base.get_local_mouse_position())
		var position = base_to_build(clicked_cell)
		
		if !inside_boundaries(position):
			pass
	#		print("outside bounds")
			
		elif $TML_Buildings.get_cell_tile_data(position):
			print("population:")
			print(getBlockData(position, BlockData.POPULATION))
			spread_block(position)
		
		elif !is_buildable(position):
			print("can't build here")
		
		
		else:
			if $Hand.get_selected_card():
				var card = $Hand.get_selected_card()
				build_from_card(card, position)
				$Hand.remove_card(card)
			else:
				build_block(position,Block.MIXED,100)
		
#		spread_blocks()

func spread_blocks():
	var block_positions = $TML_Buildings.get_used_cells()
	
	for coord in block_positions:
		if getBlockData(coord, BlockData.POPULATION) >= spread_threshold:
			spread_block(coord)

func pass_turn():
	spread_blocks()
	draw_card()

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
	
	setBlockData(coords, BlockData.POPULATION, population)
	setBlockData(coords, BlockData.BLOCK_TYPE, type)

func build_from_card(card, position):
	$TML_Buildings.set_cell(position, 1, Vector2i(0,0))

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
	var type = getBlockData(position, BlockData.BLOCK_TYPE)
	var og_population = getBlockData(position, BlockData.POPULATION)
	var population = og_population / 5
	
	# get free space with maximum attractiveness
	# create new block of same type and 20% population
	build_block(surrounding[0], type, population)
	 
	return true

func draw_card():
	if hand.card_count() == 0:
		hand.add_card("LIBRARY")
	elif hand.card_count() == 1: 
		hand.add_card("CLINIC")
	elif hand.card_count() ==2:
		hand.add_card("PARK")
	else:
		return

#func pass_turn():
	# draw cards
	# handle player action
#	while !player_action():
#		pass	
	
	# recalculate?
	# spread
#	spread_blocks()
	
	# recalculate?


func _on_btn_draw_pressed() -> void:
	draw_card()



func _on_btn_turn_pressed() -> void:
	pass_turn()
