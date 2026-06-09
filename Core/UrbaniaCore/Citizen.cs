namespace UrbaniaCore;

public class CitizenType
{
    public string Name { get; }
    public int StartingAge { get; }
    public int MaxAge { get; }
    public float StartingWealth { get; }
    public float YearlyWealthGrowth { get; }
    public float DisabilityChance { get; }
    public float DeathChance { get; }
}

    
public class Citizen
{
    private static Random rng = new();

    private Household Household;
    public CitizenType Type { get; private set; }
    public string Name { get; }
    public int Age { get; private set; }
    public float Wealth { get; private set; }
    public float Health { get; set; }
    public float Joy { get; set; }
    public bool Disabled { get; set; }

    public Citizen(CitizenType type, Household household, string name)
    {
        Household = household;
        Type = type;
        Name = name;
        Age = type.StartingAge;
        Wealth = type.StartingWealth;
        Disabled = RollDisability();
    }

    public void ChangeWealth(float amount)
    {
        this.Wealth += amount;
    }

    public bool CanAfford(float cost)
    {
        return Wealth >= cost;
    }

    public void AgeUp(int amount)
    {
        Age += amount;

        //if(Age > Type.MaxAge)
        //    Type = Type.NextType();
    
        // random distributed chance to acquire disability
        if(!Disabled && RollDisability())
            Disabled = true;

        // random distributed chance to die
        if(RollDeath())
            Household.RemoveMember(this);

    }

    private bool RollDisability()
    {
        return rng.NextDouble() >= Type.DisabilityChance;
    }

    private bool RollDeath()
    {
        return rng.NextDouble() >= Type.DeathChance;
    }

}