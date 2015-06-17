concrete PaleoEng of Paleo = {

lincat
    S = Str;

    Time, TimePoint, Period = Str;
    Thing, Group = Str;
    Action, Property = Str;

lin
    TimeFocus thing action time = thing ++ action ++ time;
    TimeTopic time action thing = time ++ action ++ thing;
    Attribution thing property = thing ++ "is" ++ property;

    During period = "during" ++ period;
    At time = "at" ++ time;
    Interval beg end = "from" ++ beg ++ "to" ++ end;
    Point period = period;
    Start period = "the beggining of" ++ period;
    End period = "the end of" ++ period;

    Carboniferous = "the Carboniferous";
    Cretaceous = "the Cretaceous";
    Permian = "the Permian";
    Triassic = "the Triassic";
    Cambrian = "the Cambrian";
    Silurian = "the Silurian";
    Present = "the Present";

    Extant group = "all living" ++ group;
    Fossil group = "fossil" ++ group;
    FossilRecord group = "the fossil record of" ++ group;
    Clade group = group;

    Reptiles = "Reptiles";
    Dinosaurs = "Dinosaurs";
    Rugose = "Rugose";
    Mammals = "Mammals";

    EvolveFrom group = "evolved from" ++ group;
    EvolveTo group  = "evolved into" ++ group;
    Appear = "appeared";
    BeInTheRecord = "are known in the fossil record";
    BecomeExtinct = "became extinct";
    Diversify = "experienced a significant adaptive radiation";

    ExtinctOrderOf group = "extinct order of" ++ group;
    PassiveSuspensionFeeder = "passive suspension feeders";
    UsefulEnvironmentalIndicator = "useful environmental indicators";
}

