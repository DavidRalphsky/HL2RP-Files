local FACTION = Clockwork.faction:New("Enslaved Vortigaunt");

FACTION.useFullName = true;
FACTION.whitelist = true;
FACTION.material = "halfliferp/factions/vort";
FACTION.models = {
	female = {"models/vortigaunt_slave.mdl"},
	male = {"models/vortigaunt_slave.mdl"}
};

-- Called when a player is transferred to the faction.
function FACTION:OnTransferred(player, faction, name)
	if (faction.name == FACTION_VORT) then
		if (player:QueryCharacter("gender") == GENDER_MALE) then
			player:SetCharacterData("model", self.models.male[1], true);
		else
			player:SetCharacterData("model", self.models.female[1], true);
		end;
	else
		return false;
	end;
end;

FACTION_VORTSLAVE = FACTION:Register();