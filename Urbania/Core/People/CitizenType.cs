using System.Text.Json;
using System.Text.Json.Nodes;

namespace Urbania.People;

public enum TransitionTrigger
{
    MaxAgeReached,
    Yealy
}

public record Transition(string Trigger, string TargetType, float Probability);

public class CitizenType
{    
    public string Name { get; set; }
    public int StartingAge { get; set; }
    public int MaximumAge { get; set; }
    public float StartingWealth { get; set; }
    public float YearlyWealthGrowth { get; set; }
    public float DisabilityChance { get; set; }
    public float DeathChance { get; set; }

    public Dictionary<string, float> StatImpact { get; set; }
    public List<Transition> Transitions { get; set; }

    public CitizenType TransitionMaxAge()
    {
        // TODO
        return this;
    }
    public CitizenType TransitionAgeUp()
    {
        // TODO
        return this;
    }

}
