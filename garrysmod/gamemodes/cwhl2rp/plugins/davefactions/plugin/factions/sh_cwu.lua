local FACTION = Clockwork.faction:New("Civil Worker's Union");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.models = {
	female = {
		"models/tnb/citizens/female_01.mdl",
		"models/tnb/citizens/female_02.mdl",
		"models/tnb/citizens/female_07.mdl",
		},
	male = {
		"models/tnb/citizens/male_02.mdl",
		"models/tnb/citizens/male_04.mdl",
		"models/tnb/citizens/male_06.mdl",
		"models/tnb/citizens/male_08.mdl",
		};
};
 
-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (player:QueryCharacter("gender") == GENDER_MALE) then
        player:SetCharacterData("model", self.models.male[1], true);
    else
        player:SetCharacterData("model", self.models.female[1], true);
    end;
end;

FACTION_CWU = FACTION:Register();