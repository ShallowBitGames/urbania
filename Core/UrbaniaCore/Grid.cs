using System.Runtime.CompilerServices;

namespace UrbaniaCore;

public class Grid
{
    public Grid(int radius)
    {
        Radius = radius;

        Squares = new Square[radius, radius];

        for(int i = 0; i < radius; i++)
            for(int j = 0; j < radius; j++)
                Squares[i, j] = new Square();
    }

    public Square[,] Squares { get; set; }

    public int Radius { get; private set; }

    public void RedistributePopulation()
    {
        
    }

    public void Immigrate(int amount)
    {
        
    }
}