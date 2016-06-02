--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("alcohol_base");
ITEM.name = "Beer";
ITEM.cost = 20;
ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl";
ITEM.weight = 1.1;
ITEM.access = "L";
ITEM.useText = "Drink";
ITEM.category = "Alcohol";
ITEM.business = true;
ITEM.description = "A transulcent bottle of Beer.  It has a strong smell to it.";

function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 1, 0, player:GetMaxHealth() ) );
	
	-- This won't get you drunk. Meh.
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();