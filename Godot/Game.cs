using Godot;
using System;

public partial class Game : Node
{
	private const int Radius = 10;
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		// generate a grid

		// create blocks
		// temp: grab the tilemap and place a square at the center
		// (-1, 0)
		var TmlBuildings = this.GetNode<TileMapLayer>("Map/TML_Buildings");

		TmlBuildings.SetCell(new Vector2I(-1, 0), 1, new Vector2I (0, 1));
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
		// 
	}


	// The top corner of the isometric map corresponds to the origin
	// of the grid
	private (int, int) CellToGridCoordinates(Vector2I cellCoordinates)
	{
		int x = cellCoordinates.X + Radius + 1;
		int y = cellCoordinates.Y + Radius;

		return (x, y);
	}

	private Vector2I GridToCellCoordinates((int x, int y) gridCoordinates)
	{
		return new Vector2I(gridCoordinates.x - Radius - 1, 
							gridCoordinates.y - Radius);
	}
}
