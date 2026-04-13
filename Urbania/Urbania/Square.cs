namespace Urbania {

public enum TerrainType
{
    EARTH,
    WATER        
}

public class Building
{
    
}


public class Effect
{
    
}

public class Square
{
    public TerrainType Terrain { get; private set; }
    public Building? Building { get; private set; }
    public Population Population { get; private set; }
    public List<Effect> Effects { get; private set; }
}

}