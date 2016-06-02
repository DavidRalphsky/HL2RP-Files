local FACTION = Clockwork.faction:New("Combine Civil Authority Science Division");

FACTION.isCombineFaction = true;
FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.models = {
	female = {
		"models/humans/group17/female_01.mdl",
		"models/humans/group17/female_02.mdl",
		"models/humans/group17/female_03.mdl",
		"models/humans/group17/female_04.mdl",
		"models/humans/group17/female_06.mdl",
		"models/humans/group17/female_07.mdl"
	},
	male = {
		"models/humans/apsci01/male_01.mdl",
		"models/humans/apsci01/male_02.mdl",
		"models/humans/apsci01/male_03.mdl",
		"models/humans/apsci01/male_04.mdl",
		"models/humans/apsci01/male_05.mdl",
		"models/humans/apsci01/male_06.mdl",
		"models/humans/apsci01/male_07.mdl",
		"models/humans/apsci01/male_08.mdl",
		"models/humans/apsci01/male_09.mdl"
	};
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name != FACTION_CITIZEN) then
		return false;
	end;
end;

FACTION_SCIENCE = FACTION:Register();