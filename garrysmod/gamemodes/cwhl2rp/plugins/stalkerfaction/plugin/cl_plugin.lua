local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

Clockwork.directory:AddCategory("Stalker", "Commands");

-- A function to get whether a player is Vortigaunt.
function PLUGIN:PlayerIsStalker(player)
	if (!IsValid(player)) then
		return;
	end;

	local faction = player:GetFaction();
	
	if (PLUGIN:IsStalkerFaction(faction)) then
		if (faction == FACTION_STALKER) then
			return true;
		else
			return false;
		end;
	end;
end;