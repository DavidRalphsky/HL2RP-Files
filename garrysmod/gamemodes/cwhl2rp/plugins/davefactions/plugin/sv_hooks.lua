local PLUGIN = PLUGIN;
function PLUGIN:GetPlayerDefaultInventory(player, character, inventory)
		player:GiveItem(Clockwork.item:CreateInstance("union_card"));
end;