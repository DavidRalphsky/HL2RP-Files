local ITEM = Clockwork.item:New()
ITEM.name = "Access Card"
ITEM.model = "models/gibs/metal_gib4.mdl"
ITEM.weight = 0.1
ITEM.category = "Security"
ITEM.factions = {FACTION_CITIZEN}
ITEM.business = false
ITEM.description = "A card with some text on it saying saying \"ACCESS CARD\"."

function ITEM:OnDrop(player)
	return true
end

ITEM:Register()