local PLUGIN = PLUGIN;
function PLUGIN:PlayerCanUseDoor(player, door)
	if (player:GetSharedVar("tied") != 0 or (!PLUGIN:PlayerIsCombine(player) and player:GetFaction() != FACTION_ADMIN)) then
		return false;
	else
		return true;
	end;
end;
function PLUGIN:GetPlayerDefaultInventory(player, character, inventory)
	if PLUGIN:PlayerIsCombine(player) then
		player:GiveItem(Clockwork.item:CreateInstance("unit_id_card"));
	end;
end;