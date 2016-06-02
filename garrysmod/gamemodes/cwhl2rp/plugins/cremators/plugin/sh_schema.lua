local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

function PLUGIN:PlayerIsCremator(faction)
	return (faction == FACTION_CREMATOR);
end;

-- Borrowed this from RJ, sorry!
function PLUGIN:IsCrematorFaction(player)
	if (!IsValid(player)) then
		return;
	end;

	local faction = player:GetFaction();
	
	if (PLUGIN:PlayerIsCremator(faction)) then
		-- if (faction == FACTION_CREMATOR) then
			return true;
		else
			return false;
		-- end;
	end;
end;

