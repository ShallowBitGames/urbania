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


    public record BlockType(string TypeString, bool CanBuildNew, bool CanBuildAddition, BlockFactory Factory);

    public static readonly BlockType None = new BlockType("NONE", true, false);
    public static readonly BlockType Mixed = new BlockType("MIXED", true, true);
    public static readonly BlockType Poor = new BlockType("POOR", true, true);
    public static readonly BlockType Student = new BlockType("STUDENT", true, true);
    public static readonly BlockType Trendy = new BlockType("TRENDY", true, true);
    public static readonly BlockType SingleFamilyHouses = new BlockType("SFH", false, false);
    public static readonly BlockType Villas = new BlockType("VILLAS", false, false);


    public record GroundType(string TypeString, bool CanBuildOn);
    
    private static readonly Dictionary<GroundType, string> _groundStrings = new Dictionary<GroundType, string>
    {
        { GroundType.Normal, "NORMAL" },
        { GroundType.Water, "WATER" },
        { GroundType.Forest, "FOREST" }
    };
    
    public static string get(BlockType type) => _blockStrings[type];
    
    public static string get(GroundType type) =>_groundStrings[type];
}
