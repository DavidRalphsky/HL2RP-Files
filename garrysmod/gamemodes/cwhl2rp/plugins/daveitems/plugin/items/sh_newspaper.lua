--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Newspaper";
ITEM.cost = 5;
ITEM.model = "models/props_junk/garbage_newspaper001a.mdl";
ITEM.weight = 0.3;
ITEM.access = "l"
ITEM.category = "Reusables";
ITEM.business = true;
ITEM.description = "A dirty newspaper.";

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) end;

function ITEM:OnUse(player, itemEntity)
	player:SendLua("gui.OpenURL('")
	return true;
end;

ITEM:Register();
