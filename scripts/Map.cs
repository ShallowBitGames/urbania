using Godot;
using System;

public partial class Map : Node
{
    public int Width { get; }
    public int Height { get; }
    
    private Block[,] _blocks;

    public Map(int width, int height)
    {
        Width = width;
        Height = height;
        
        _blocks = new Block[width, height];
    }

    


}