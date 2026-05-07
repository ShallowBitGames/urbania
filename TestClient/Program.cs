using System.Runtime.Serialization;
using System.Text.Json;
using Urbania.People;

Console.WriteLine("Hello, World!");

using(FileStream sr = File.OpenRead("../../../../Core/Data/CitizenTypes.json"))
{
    Dictionary<string, CitizenType> citizenTypes = 
        JsonSerializer.Deserialize<Dictionary<string, CitizenType>>(sr);

    foreach((string k, CitizenType v) in citizenTypes){
        Console.WriteLine($"Key: {k}, Name: {v.Name}");

        Console.WriteLine("Stats:");
        foreach((var key, var val) in v.StatImpact)
            Console.WriteLine($"{key}: {val}");
        
        Console.WriteLine("Transitions:");
        foreach(Transition t in v.Transitions)
            Console.WriteLine(t);

    }
    Console.WriteLine();
}

