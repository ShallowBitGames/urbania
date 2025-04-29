using System;
using System.Collections.Generic;

namespace urbania.scripts;

public enum BlockType
{
    None,
    Mixed,
    Poor,
    Student,
    Trendy,
    SFH,
    Villas
}

public enum GroundType
{
    Normal,
    Water,
    Forest
}

/*
 * I prefer working with enums in C#...
 * Mapping to strings for use in GDScript
 */

public static class TileStrings
{
    private static readonly Dictionary<BlockType, string> _blockStrings = new Dictionary<BlockType, string>
    {
        { BlockType.None, "NONE" },
        { BlockType.Mixed, "MIXED" },
        { BlockType.Poor, "POOR" },
        { BlockType.Student, "STUDENT" },
        { BlockType.Trendy, "TRENDY" },
        { BlockType.SFH, "SFH" },
        { BlockType.Villas, "VILLAS" },
    };

    private static readonly Dictionary<GroundType, string> _groundStrings = new Dictionary<GroundType, string>
    {
        { GroundType.Normal, "NORMAL" },
        { GroundType.Water, "WATER" },
        { GroundType.Forest, "FOREST" }
    };
    
    public static string get(BlockType type) => _blockStrings[type];
    
    public static string get(GroundType type) =>_groundStrings[type];
}
