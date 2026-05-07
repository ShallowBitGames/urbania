namespace Urbania.People
{
    
public class Household
{
    List<Citizen> Members = new();

    public void RemoveMember(Citizen citizen)
    {
        Members.Remove(citizen);
    }

    public void AddCitizen(Citizen citizen)
    {
        Members.Add(citizen);
    }

    public float TotalWealth()
    {
        return Members.Sum(c => c.Wealth);
    }

    public int NumberMembers()
    {
        return Members.Count;
    }
        
}

}