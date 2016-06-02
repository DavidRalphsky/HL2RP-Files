local PLUGIN = PLUGIN

PLUGIN.chardata = Clockwork.kernel:NewLibrary("CharData")

-- A function to add an empty line
function PLUGIN.chardata:AddEmptyLine()
	return "\n"
end

function PLUGIN.chardata:AddName(player)
	return "Name: "..player:Name().."\n"
end

function PLUGIN.chardata:AddCID(player)
	if SERVER then
		return "CID: "..player:GetCharacterData("citizenid").."\n"
	else
		return "CID: "..player:GetSharedVar("citizenID").."\n"
	end
end

function PLUGIN.chardata:AddLine(text)
	return text.."\n"
end

function PLUGIN.chardata:AddCallbackLine(player, text, callback) -- Normally you wouldn't need this. But it's useful to have it so you know which lines are custom.
	return text..callback(player).."\n"
end

function PLUGIN.chardata:GetCitizenFormat(player)
	local text = ""
	text = text..self:AddName(player)
	text = text..self:AddCID(player)
	text = text..self:AddEmptyLine()
	text = text..self:AddLine("Status: Alive")
	text = text..self:AddLine("Citizenship: Benignant")
	text = text..self:AddEmptyLine()
	text = text..self:AddLine("Loyalist Points: 0")
	text = text..self:AddLine("Criminal Points: 0")
	text = text..self:AddLine("------------------")
	text = text..self:AddLine("Total: 0")
	text = text..self:AddEmptyLine()
	text = text..self:AddLine("-------------------- RECORD --------------------")
	text = text..self:AddLine("OFFENCE|OFFENCE DETAILS|POINTS|ADDED BY (DIGITS)")
	text = text..self:AddLine("EXAMPLE OFFENCE: Audio Violation|\"Fuck\"|1|23821")
	text = text..self:AddEmptyLine()
	text = text..self:AddLine("------------ ADDITIONAL INFORMATION ------------")
	text = text..self:AddCallbackLine(player, "Transferred on: ", function(player) return os.date("%d %B %Y", player:GetTimeCreated()) end)

	return text;
end

function PLUGIN.chardata:GetCombineFormat()
	return ""
end