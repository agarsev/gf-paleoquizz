abstract Paleo = {

flags startcat = S;

cat
    S;

    Time; Period;
    Thing; Group;
    Action; Property;

fun
    -- Sentences with time: thing x action x time
    TimeFocus: Thing -> Action -> Time -> S ; -- the topic is the thing and the focus the time
    TimeTopic: Time -> Action -> Thing -> S ; -- the topic is the time and the focus the thing

    -- Attributive sentences
    Attribution: Thing -> Property -> S;

    -- Times
    During: Period -> Time;
    At: Period -> Time;
    Interval: Time -> Time -> Time;
    Start: Period -> Period;
    End: Period -> Period;

    Carboniferous, Cretaceous, Permian, Triassic, Cambrian, Silurian, Present : Period;

    -- Things
    Extant: Group -> Thing;
    Fossil: Group -> Thing;
    FossilRecord: Group -> Thing;
    Clade: Group -> Thing;

    Reptiles, Dinosaurs, Rugose, Mammals : Group;

    -- Actions
    EvolveFrom: Group -> Action;
    EvolveTo: Group -> Action;
    Appear, BeInTheRecord, BecomeExtinct, Diversify: Action;

    -- Properties
    ExtinctOrderOf: Group -> Property;
    PassiveSuspensionFeeder, UsefulEnvironmentalIndicator: Property;
}
