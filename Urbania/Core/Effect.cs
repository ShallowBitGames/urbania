namespace Urbania.Core
{
    enum EffectType
    {
        LOCALIZED_LOSS,
        LOCALIZED_NOLOSS,
        GLOBAL
    }

    enum Stat
    {
        SOCIAL,
        INDUSTRY,
        CULTURE,
        NATURE,
        EDUCATION
    }
    
    class Effect
    {
        public EffectType Type { get; set; }
        public int Reach { get; set; }
        public Dictionary<Stat, int> StatBonus { get; set; }
    }

}