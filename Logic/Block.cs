using System;
using urbania.scripts;

public class Block
{
    public BlockTypes.BlockType Type { get; private set; }
    public int Population { get; private set; }
    public double Attractiveness { get; private set; }
    public double QoL{ get; private set; }


    public Block(BlockTypes.BlockType type, int  population = 0, double attractiveness = 0, double qoL = 0)
    {
        Type = type;
        Population = population;
        Attractiveness = attractiveness;
        QoL = qoL;
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
    
    
    
}
