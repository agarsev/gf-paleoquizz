abstract Paleo = {

flags startcat = S;

cat
    S;

    Time; TimePoint; Period;
    Group;
    Action;

fun
    -- Time sentences
    TimeFocus: Group -> Action -> Time -> S; -- the topic is the thing and the focus the time
    TimeTopic: Time -> Action -> Group -> S; -- the topic is the time and the focus the thing

    -- Times
    During: Period -> Time;
    At: TimePoint -> Time;
    Interval: TimePoint -> TimePoint -> Time;
    Start: Period -> TimePoint;
    End: Period -> TimePoint;

    Precambrian, Cambrian, Ordovician, Silurian, Devonian, Carboniferous, Permian: Period;
    Triassic, Jurassic, Cretaceous, Paleocene, Eocene, Oligocene, Miocene, Pliocene, Quaternary : Period;

    -- Groups
    Reptiles, Dinosaurs, Rugose, Mammals : Group;

    -- Actions
    EvolveFrom: Group -> Action;
    Appear, BeInTheRecord, BecomeExtinct, Diversify: Action;

}
