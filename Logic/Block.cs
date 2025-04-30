using Godot;
using System;
using urbania.scripts;

public partial class Block : Node
{
    public BlockType Type { get; private set; }
    public int Population { get; private set; }
    public float Attractiveness { get; private set; }
    public float QoL{ get; private set; }


    public Block(BlockType type)
    {
        Type = type;
    }
    
    public void IncreasePopulation(int amount)
    {
        Population += amount;
    }

    public void DecreasePopulation(int amount)
    {
        if(Population >= amount)
            Population -= amount;
        else
            Population = 0;
    }


    public static Block Generate(BlockType type)
    {
        
    }
    
}
