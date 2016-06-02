--[[
	© 2012 CloudSixteen.com do not share, re-distribute or modify
	without permission of its author (kurozael@gmail.com).
--]]

local ITEM = Clockwork.item:New("alcohol_base");
ITEM.name = "Moonshine";
ITEM.cost = 75;
ITEM.model = "models/props_junk/garbage_plasticbottle003a.mdl";
ITEM.weight = 1.2;
ITEM.access = "L";
ITEM.useText = "Use";
ITEM.category = "Alcohol";
ITEM.business = true;
ITEM.description = "A large soda bottle with words 'Moon Shine' written in ink on the side.";

function ITEM:OnUse(player, itemEntity)
	player:SetSharedVar("antidepressants", CurTime() + 600);
end;

-- Called when a player drops the item.
function ITEM:OnDrop(player, position) 

end;


ITEM:Register();