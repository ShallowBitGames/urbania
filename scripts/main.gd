extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

#func _input(event):
#	if event.is_action_released("left_click"):
#		pass

var done = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("left_click"):
		var clicked_cell = $TML_Base.local_to_map($TML_Base.get_local_mouse_position())
		var newpos = Vector2i(clicked_cell[0]-1, clicked_cell[1]-1)
		
		if $TML_Buildings.get_cell_tile_data(newpos):
			print("already a block here")
			#$TML_Buildings.set_cell(clicked_cell, 1, Vector2i(0,0))
		else:	
			$TML_Buildings.set_cell(newpos, 1, Vector2i(0,0))
			#print("not a block")
	

#func player_action() -> bool:
#	if Input.is_action_just_pressed("left_click"):
#		return true
#	else:
#		return false

func spread_blocks():
	var block_positions = $TML_Buildings.get_used_cells()
	for vec in block_positions:
		print(vec)
	
	print("first block?: ")
	print(block_positions[0])
	
	print($TML_Buildings.get_cell_tile_data(block_positions[0]))
	
	print("Before:")
	print($TML_Buildings.get_cell_source_id(block_positions[0]))
	print($TML_Buildings.get_cell_atlas_coords(block_positions[0]))
	$TML_Buildings.set_cell(block_positions[0], 1, Vector2i(0,1))
	#$TML_Buildings.erase_cell(block_positions[1])
	print("After:")
	print($TML_Buildings.get_cell_source_id(block_positions[0]))
	print($TML_Buildings.get_cell_atlas_coords(block_positions[0]))

#func pass_turn():
	# draw cards
	# handle player action
#	while !player_action():
#		pass	
	
	# recalculate?
	# spread
#	spread_blocks()
	
	# recalculate?
