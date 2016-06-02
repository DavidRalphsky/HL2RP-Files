--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Doughnuts";
ITEM.cost = 40;
ITEM.model = "models/props_lab/box01b.mdl";
ITEM.weight = 0.7;
ITEM.access = "L";
ITEM.useText = "Consume";
ITEM.category = "Food";
ITEM.business = true;
ITEM.description = "A box of doughnuts covered in icing and sprinkles.";

function ITEM:OnUse(player, itemEntity)
	player:SetHealth( math.Clamp( player:Health() + 10, 0, player:GetMaxHealth() ) );
	
	player:BoostAttribute(self.name, ATB_STRENGTH, 4, 120);
	player:BoostAttribute(self.name, ATB_STAMINA, 4, 120);
	-- "Mmm.. Doughnuts" ~ Homer Simpson
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();