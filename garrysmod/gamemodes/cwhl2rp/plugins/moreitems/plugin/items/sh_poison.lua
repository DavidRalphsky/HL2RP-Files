--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("alcohol_base");
ITEM.name = "Cyanide";
ITEM.cost = 165;
ITEM.model = "models/props_junk/PopCan01a.mdl";
ITEM.weight = 0.9;
ITEM.access = "L";
ITEM.useText = "Drink";
ITEM.category = "Consumables";
ITEM.business = true;
ITEM.description = "Cyanide, concealed in an ordinary looking Breen's Water can.";

function ITEM:OnUse(player, itemEntity)
	player:SetSharedVar("antidepressants", CurTime() + 9000);
	player:SetHealth( math.Clamp( player:Health() + Schema:GetHealAmount(player, -95), 0, player:GetMaxHealth() ) );
	Clockwork.plugin:Call("PlayerHealed", player, player, self);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 
  
end;


ITEM:Register();