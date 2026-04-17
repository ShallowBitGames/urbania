using System;
using System.Collections.Generic;

namespace urbania.scripts;

public static class BlockTypes
{
    public record BlockType(string TypeString, bool CanBuildNew, bool CanBuildAddition);

    public static readonly BlockType None = new BlockType("NONE", true, false);
    public static readonly BlockType Mixed = new BlockType("MIXED", true, true);
    public static readonly BlockType Poor = new BlockType("POOR", true, true);
    public static readonly BlockType Student = new BlockType("STUDENT", true, true);
    public static readonly BlockType Trendy = new BlockType("TRENDY", true, true);
    public static readonly BlockType SingleFamilyHouses = new BlockType("SFH", false, false);
    public static readonly BlockType Villas = new BlockType("VILLAS", false, false);

}

public static class GroundTypes
{
    public record GroundType(string TypeString, bool CanBuildOn);

    public static readonly GroundType Standard = new GroundType("STANDARD", true);
    public static readonly GroundType Water = new GroundType("WATER", true);
}
