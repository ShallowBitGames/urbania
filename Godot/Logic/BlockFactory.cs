using System;
using System.Collections;
using System.IO;
using static urbania.scripts.BlockTypes;
namespace urbania.scripts;

class BlockData(BlockType type_, int initialPopulation_, int baseQoL_, int baseAttr_, int averageAge_)
{
    public BlockType type = type_;
    public int initialPopulation = initialPopulation_;
    public int baseQoL =  baseQoL_;
    public int baseAttr = baseAttr_;
    public int averageAge = averageAge_;
}

static class BlockFactory
{
    public static Block Generate(BlockType type)
    {
        //string pathToData = $"..\\BlockData\\{type.TypeString}.json";
        BlockData data;
        
        if(type == Mixed)
            data = new BlockData(BlockTypes.Mixed, 200, 100, 100, 35);
        else if(type == Poor)
            data = new BlockData(BlockTypes.Poor, 400, 50, 50, 35);
        else if(type == Trendy)
            data = new BlockData(BlockTypes.Trendy, 300, 120, 120, 25);
        else
            throw new NotImplementedException("Trying to create block of unimplemented type: " + type);

        Block block = new Block(type, data.initialPopulation, data.baseAttr, data.baseQoL);
        
        return block;
    }
    
}



 