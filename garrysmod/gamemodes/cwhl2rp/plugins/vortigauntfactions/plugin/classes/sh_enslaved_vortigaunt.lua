local CLASS = Clockwork.class:New("Enslaved Vortigaunt");

CLASS.color = Color(255, 200, 100, 255);
CLASS.factions = {FACTION_VORTSLAVE};
CLASS.isDefault = true;
CLASS.wagesName = "Supplies";
CLASS.description = "An alien race not from this planet but enslaved by the Union.";
CLASS.defaultPhysDesc = "A green looking thing with many eyes and devices on it.";
	
CLASS_VORTSLAVE = CLASS:Register();