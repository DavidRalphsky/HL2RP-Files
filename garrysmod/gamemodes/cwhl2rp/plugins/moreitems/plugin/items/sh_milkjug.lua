--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Milk Jug";
ITEM.cost = 22;
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl";
ITEM.weight = 1.1;
ITEM.access = "L";
ITEM.useText = "Consume";
ITEM.category = "Food";
ITEM.business = true;
ITEM.description = "A large jug of Semi-Skimmed Milk.";

function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 9, 0, player:GetMaxHealth() ) );
	
	player:BoostAttribute(self.name, ATB_STRENGTH, 4, 120);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();