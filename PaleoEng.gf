concrete PaleoEng of Paleo = {

lincat
    S = Str;

    Time = TimePosition => Str;
    TimePoint, Period = Str;
    Group = Str;
    Action = TimePosition => Str;

lin
    -- Sentences with time: thing x action x time
    TimeFocus thing action time = thing ++ action ! Focus ++ time ! Focus;
    TimeTopic time action thing = time ! Topic ++ action ! Topic ++ thing;

    -- Times
    During period = table {
        Topic => period;
        Focus => "during" ++ period
    };
    At timepoint = table {
        Topic => timepoint;
        Focus => "at" ++ timepoint
    };
    Interval beg end = table {
        Topic => "the period from" ++ beg ++ "to" ++ end;
        Focus => "from" ++ beg ++ "to" ++ end
    };
    Start period = "the beggining of" ++ period;
    End period = "the end of" ++ period;

    Precambrian = "the Precambrian";
    Cambrian = "the Cambrian";
    Ordovician = "the Ordovician";
    Silurian = "the Silurian";
    Devonian = "the Devonian";
    Carboniferous = "the Carboniferous";
    Permian = "the Permian";
    Triassic = "the Triassic";
    Jurassic = "the Jurassic";
    Cretaceous = "the Cretaceous";
    Paleocene = "the Paleocene";
    Eocene = "the Eocene";
    Oligocene = "the Oligocene";
    Miocene = "the Miocene";
    Pliocene = "the Pliocene";
    Quaternary = "the Quaternary";

    -- Groups
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
        Topic => "has fossiles of";
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

param
    TimePosition = Topic | Focus;
}

