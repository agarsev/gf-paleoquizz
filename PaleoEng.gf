concrete PaleoEng of Paleo = {

lincat
    S = Str;

    Time, TimePoint, Period = Str;
    Thing, Group = Str;
    Action = TimePosition => Str;

lin
    -- Sentences with time: thing x action x time
    TimeFocus thing action time = thing ++ action ! Focus ++ time;
    TimeTopic time action thing = time ++ action ! Topic ++ thing;

    -- Times
    During period = "during" ++ period;
    In period = "in" ++ period;
    At time = "at" ++ time;
    Interval beg end = "from" ++ beg ++ "to" ++ end;
    Start period = "the beggining of" ++ period;
    End period = "the end of" ++ period;

    Carboniferous = "the Carboniferous";
    Cretaceous = "the Cretaceous";
    Permian = "the Permian";
    Triassic = "the Triassic";
    Cambrian = "the Cambrian";
    Silurian = "the Silurian";
    Recent = "Recent";

    -- Things
    Extant group = "all living" ++ group;
    Fossil group = "fossil" ++ group;
    FossilRecord group = "the fossil record of" ++ group;

    Reptiles = "Reptiles";
    Dinosaurs = "Dinosaurs";
    Rugose = "Rugose";
    Mammals = "Mammals";

    -- Actions
    EvolveFrom group = table {
        Topic => "witnessed the evolution of" ++ group ++ "into";
        Focus => "evolved from" ++ group
    };
    Appear = table {
        Topic => "witnessed the emergence of";
        Focus => "appeared"
    };
    BeInTheRecord = table {
        Topic => "WRONG!";
        Focus => "are known in the fossil record"
    };
    BecomeExtinct = table {
        Topic => "witnessed the extinction of";
        Focus => "became extinct"
    };
    Diversify = table {
        Topic => "witnessed a significant adaptive radiation of";
        Focus => "experienced a significant adaptive radiation"
    };

    -- Properties
    ExtinctOrderOf sub sup = sub ++ "are an extinct order of" ++ sup;
    PassiveSuspensionFeeder g = g ++ "are passive suspension feeders";
    UsefulEnvironmentalIndicator g = g ++ "are useful environmental indicators";

param
    TimePosition = Topic | Focus;
}

