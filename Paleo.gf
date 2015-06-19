abstract Paleo = {

flags startcat = S;

cat
    S;

    Time; TimePoint; Period;
    Thing; Group;
    Action;

fun
    -- Time sentences
    TimeFocus: Group -> Action -> Time -> S; -- the topic is the thing and the focus the time
    TimeTopic: Period -> Action -> Group -> S; -- the topic is the time and the focus the thing

    -- Times
    During: Period -> Time;
    In: Period -> Time;
    At: TimePoint -> Time;
    Interval: TimePoint -> TimePoint -> Time;
    Start: Period -> TimePoint;
    End: Period -> TimePoint;

    Carboniferous, Cretaceous, Permian, Triassic, Cambrian, Silurian, Recent : Period;

    -- Things
    Extant: Group -> Thing;
    Fossil: Group -> Thing;
    FossilRecord: Group -> Thing;

    Reptiles, Dinosaurs, Rugose, Mammals : Group;

    -- Actions
    EvolveFrom: Group -> Action;
    Appear, BeInTheRecord, BecomeExtinct, Diversify: Action;

    -- Properties
    ExtinctOrderOf: Group -> Group -> S;
    PassiveSuspensionFeeder, UsefulEnvironmentalIndicator: Thing -> S;
}
