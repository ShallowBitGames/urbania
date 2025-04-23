using Godot;
using System;

public partial class Block : Node
{
    public int Population { get; private set; }
    public float Attractiveness { get; private set; }
    public float QoL{ get; private set; }
    
    
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
