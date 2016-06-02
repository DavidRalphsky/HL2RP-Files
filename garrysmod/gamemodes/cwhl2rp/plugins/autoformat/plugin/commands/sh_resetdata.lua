local PLUGIN = PLUGIN

local COMMAND = Clockwork.command:New("ResetData")
COMMAND.flags = CMD_DEFAULT
COMMAND.tip  = "Resets the data of a citizen completely to the standard format."
COMMAND.text = "<string Name>"
COMMAND.arguments = 1

function COMMAND:OnRun(player, arguments)
	if !Schema:PlayerIsCombine(player) then
		Clockwork.player:Notify(player, "You are not the Combine!")
		return
	end
	local target = Clockwork.player:FindByID(arguments[1])
	if target then
		if !Schema:PlayerIsCombine(target) then
			target:SetCharacterData("combinedata", PLUGIN.chardata:GetCitizenFormat(target))
			Clockwork.player:Notify(player, "You reset "..target:Name().."'s data")
		end
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid name!")
	end
end

COMMAND:Register()