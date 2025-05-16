using System;
using static urbania.scripts.BlockTypes;
using urbania.scripts;

public partial class Map
{
    public int Width { get; }
    public int Length { get; }
    
    private Tile[,] _tiles;
    
    public struct Tile
    {
        public GroundTypes.GroundType GroundType { get; set; }
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
                GroundTypes.GroundType ground = _tiles[i, j].GroundType;
                groundMap[i, j] = ground.TypeString;
            }
        
        return groundMap;
    }

    public bool IsBuildable(int x, int y)
    {
        Tile tile = _tiles[x,y];
        
        bool groundIsBuildable = tile.GroundType.CanBuildOn;

        bool isFree = tile.TownBlock.Type.CanBuildNew;
        
        return groundIsBuildable && isFree;
    }

    public void CreateBlock(int x, int y, BlockType type)
    {
        _tiles[x, y].TownBlock = BlockFactory.Generate(type);
    }


    public void PassTurn()
    {
        // State: user-driven changes have already been handled
        // (meaning: new block built, displacement taken care of and values recalculated)
        
        // Each tile draws population
        
        // Internal migration
        
    }
    
}