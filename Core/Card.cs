using System.Text.Json.Nodes;

namespace Urbania.Core {
/*
    class Card {

        public string Title { get; }
        public int Cost { get; }
        public Building? CreatesBuilding { get; }
        public List<Effect> Effects { get; }

        Card(JsonObject json, JsonObject buildingDictJson){

            Title = json.GetText("Name");
            Cost = json.GetInteger("Cost");

            if(json.Contains("CreatesBuilding")){
                string buildingKey = json.GetText("CreatesBuilding");          
                JsonObject buldingJson = buildingDictJson.GetObject(buildingKey);
                CreatesBuilding = Building(jsonBuilding);
            }

            Effect = [];
            if(json.Containts("Effect")){
                JsonObject effectJson = json.GetObject("Effect");
                Effects.Add(new Effect(effectJson));
            }

            if(json.Contains("Effects")){
                JsonArray effectsArray = json.GetArray("Effects");
                foreach(JsonObject effectJson in effectsArray)
                    Effects.Add(new Effect(effectJson));
            }
            
        }
    }
*/
}