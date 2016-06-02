--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("alcohol_base");
ITEM.name = "Krokidil";
ITEM.cost = 185;
ITEM.model = "models/props_c17/TrapPropeller_Lever.mdl";
ITEM.weight = 0.9;
ITEM.access = "L";
ITEM.useText = "Inject";
ITEM.category = "Drugs";
ITEM.useSound = "weapons/knife/knife_hit1.wav";
ITEM.business = true;
ITEM.description = "It doesn't look safe, but it certainly can make you hallucinate.";

function ITEM:OnUse(player, itemEntity)
	player:SetSharedVar("antidepressants", CurTime() + 600);
	player:SetHealth( math.Clamp( player:Health() + Schema:GetHealAmount(player, -5), 0, player:GetMaxHealth() ) );
	
	Clockwork.plugin:Call("PlayerHealed", player, player, self);

	player:BoostAttribute(self.name, ATB_STAMINA, 4, 120);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();