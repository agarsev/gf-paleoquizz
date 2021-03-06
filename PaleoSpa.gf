concrete PaleoSpa of Paleo = {

lincat
    S = Str;

    Time = TimePosition => Str;
    TimePoint, TimeBound, Period = Str;
    Group = Str;
    Action = TimePosition => Str;

lin
    -- Sentences
    TimeFocus thing action time = thing ++ action ! Focus ++ time ! Focus;
    TimeTopic time action thing = time ! Topic ++ action ! Topic ++ thing;

    -- Times
    During period = table {
        Topic => period;
        Focus => "durante" ++ period
    };
    At time = table {
        Topic => time;
        Focus => "a" ++ time
    };
    Interval beg end = table {
        Topic => "el periodo desde" ++ beg ++ "hasta" ++ end;
        Focus => "desde" ++ beg ++ "a" ++ end
    };
    Start period = "el comienzo de" ++ period;
    End period = "el final de" ++ period;
    UpgradeP p = p;
    UpgradeT t = t;

    Recent = "la actualidad";

    Precambrian = "el Precámbrico";
    Cambrian = "el Cámbrico";
    Ordovician = "el Ordovícico";
    Silurian = "el Silúrico";
    Devonian = "el Devónico";
    Carboniferous = "el Carbonífero";
    Permian = "el Pérmico";
    Triassic = "el Triásico";
    Jurassic = "el Jurásico";
    Cretaceous = "el Cretácico";
    Paleocene = "el Paleoceno";
    Eocene = "el Eoceno";
    Oligocene = "el Oligoceno";
    Miocene = "el Mioceno";
    Pliocene = "el Plioceno";
    Pleistocene = "el Pleistoceno";

    -- Groups
    Reptiles = "los reptiles";
    Amphibians = "los anfibios";
    Mollusks = "los moluscos";
    Crinoids = "los crinoides";
    Bryozoans = "los briozoos";
    Arthropods = "los artrópodos";
    Dinosaurs = "los dinosaurios";
    Mammals = "los mamíferos";
    Brachiopods = "los braquiópodos";
    Fishes = "los peces";
    Trilobites = "los trilobites";
    Ammonites = "los amonites";
    Mammoths = "los mamuts";

    EarlyAmniotes = "los primeros amniotas";
    PlacentalMammals = "los mamíferos placentados";
    ModernBonyFishes = "los peces óseos modernos";
    FloweringPlants = "las plantas con flor";

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
        Topic => "tiene registro fósil de";
        Focus => "existen en el registro fósil"
    };
    BecomeExtinct = table {
        Topic => "presenció la extinción de";
        Focus => "se extinguieron"
    };
    BecomeAbundant = table {
        Topic => "presenció una mayor abundancia de";
        Focus => "se convirtieron en abundantes"
    };
    Radiate = table {
        Topic => "presenció una significativa radiación adaptativa";
        Focus => "experimentaron una significativa radiación adaptativa"
    };
    Diversify = table {
        Topic => "presenció la diversificación de";
        Focus => "se diversificaron"
    };

param
    TimePosition = Topic | Focus;
}

