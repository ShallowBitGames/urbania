using System.ComponentModel.DataAnnotations;

namespace Urbania.People;
    
public class Citizen
{
    private static Random rng = new();
    public CitizenType Type { get; private set; }
    public int Age { get; private set; }
    public float Wealth { get; private set; }
    public float Health { get; set; }
    public float Joy { get; set; }
    public bool Disabled { get; set; }

    public Citizen(CitizenType type)
    {
        Type = type;
        Age = type.StartingAge;
        Wealth = type.StartingWealth;
        Disabled = RollDisability();
    }

    public void ChangeWealth(float amount)
    {
        Wealth += amount;
        Wealth = Math.Max(Wealth, 0);
    }

    public bool CanAfford(float cost)
    {
        return Wealth >= cost;
    }

    public void AgeUp(int amount)
    {
        Age += amount;

        if(Age > Type.MaximumAge)
            Type = Type.TransitionMaxAge();
        else
            Type = Type.TransitionAgeUp();

        // random distributed chance to acquire disability
        if(!Disabled && RollDisability())
            Disabled = true;

        // random distributed chance to die
        //if(RollDeath())
        //    Household.RemoveMember(this);

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