using Godot;
using System;
using urbania.scripts;

public partial class Map : Node2D
{
    public int Width { get; }
    public int Length { get; }
    
    private Tile[,] _tiles;
    
    public struct Tile
    {
        public GroundType GroundType { get; set; }
        public Block TownBlock { get; set; }
    }
    
    public Map(int width, int length)
    {
        Width = width;
        Length = length;
        
        _tiles = new Tile[width, length];
    }

    public void Generate()
    {
        
    }

    public string[,] GetGroundMap()
    {
        string[,] groundMap = new string[Width, Length];
        
        for(int i = 0; i < Width; i++)
            for (int j = 0; j < Length; j++) 
            {
                GroundType ground = _tiles[i, j].GroundType;
                groundMap[i, j] = TileStrings.get(ground);
            }
        
        return groundMap;
    }

    public bool IsBuildable(int x, int y)
    {
        Tile tile = _tiles[x,y];
        bool groundIsBuildable = tile.GroundType == GroundType.Normal 
                                 || tile.GroundType == GroundType.Forest;

        bool isFree = tile.TownBlock.Type == BlockType.None;
        
        return groundIsBuildable && isFree;
    }

    public void CreateBlock(int x, int y, BlockType tileStrings)
    {
        _tiles[x, y].TownBlock = new Block(tileStrings);
    }
 
}