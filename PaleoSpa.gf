concrete PaleoSpa of Paleo = {

lincat
    S = Str;

    Time, TimePoint, Period = Str;
    Group = Str;
    Action = TimePosition => Str;

lin
    -- Sentences with time: thing x action x time
    TimeFocus thing action time = thing ++ action ! Focus ++ time;
    TimeTopic time action thing = time ++ action ! Topic ++ thing;

    -- Times
    During period = "durante" ++ period;
    In period = "en" ++ period;
    At time = "en" ++ time;
    Interval beg end = "desde" ++ beg ++ "a" ++ end;
    Start period = "a comienzos de" ++ period;
    End period = "a finales de" ++ period;

    Carboniferous = "el Carbonífero";
    Cretaceous = "el Cretácico";
    Permian = "el Pérmico";
    Triassic = "el Triásico";
    Cambrian = "el Cámbrico";
    Silurian = "el Silúrico";
    Quaternary = "el Cuaternario";

    -- Groups
    Reptiles = "los reptiles";
    Dinosaurs = "los dinosaurios";
    Rugose = "los rugose";
    Mammals = "los mamíferos";

    -- Actions
    EvolveFrom group = table {
        Topic => "presenció la evolución de" ++ group ++ "en";
        Focus => "evolucionaron de" ++ group
    };
    Appear = table {
        Topic => "presenció la aparición de";
        Focus => "aparecieron"
    };
    BeInTheRecord = table {
        Topic => "?";
        Focus => "existen en el registro fósil"
    };
    BecomeExtinct = table {
        Topic => "presenció la extinción de";
        Focus => "se extinguieron"
    };
    Diversify = table {
        Topic => "presenció una significativa radiación adaptativa";
        Focus => "experimentaron una significativa radiación adaptativa"
    };

param
    TimePosition = Topic | Focus;
}

