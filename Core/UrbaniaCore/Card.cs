using System;
using System.Collections.Generic;
using System.Text;

namespace UrbaniaCore
{
    public class Card
    {
        public string Name { get; set; }
        public int Cost { get; set; }
        public List<Effect> Effects { get; set; }
        public string BuildingKey { get; set; }
        public string Filename { get; set; }
    }
}
