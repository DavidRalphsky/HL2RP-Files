--[[
	© 2013 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New();
ITEM.name = "Coffee";
ITEM.uniqueID = "roofie_w";
ITEM.cost = 14;
ITEM.model = "models/props_junk/garbage_coffeemug001a.mdl";
ITEM.weight = 1.3;
ITEM.business = false;
ITEM.attributes = {Stamina = 2};
ITEM.description = "A cup thick and slightly dark coffee.";

-- Called when a player uses the item.
function ITEM:OnUse(player, itemEntity)
	Clockwork.player:SetRagdollState(player, RAGDOLL_KNOCKEDOUT, 180);
	Clockwork.player:Notify(player, "You have been drugged!");
end;

ITEM:Register();