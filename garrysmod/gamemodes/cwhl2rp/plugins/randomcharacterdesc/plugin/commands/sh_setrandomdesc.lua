local COMMAND = Clockwork.command:New("CharGenDesc")
COMMAND.tip = "Generates a random description for a character."
COMMAND.text = "<string Name>"
COMMAND.access = "o"
COMMAND.arguments = 1

-- Called when the command has been run.
function COMMAND:OnRun(player, arguments)
	local target = Clockwork.player:FindByID(arguments[1])

	if (target) then
		local MakeDesc = function()
			local ecolours = {"Brown","Green","Hazel","Blue"}
			local hcolours = {"Brown","Black","Blonde","Red"}
			
			local height = math.random(5,6)
			if height == 6 then height = "6' "..tostring(math.random(0,2).."''")
			else height = "5' "..tostring(math.random(6,11).."''") end
			
			local weight = tostring(math.random(110,150)).." lbs"
			local age = tostring(math.random(25,70)).." Years Old"
			local eyes = ecolours[math.random(#ecolours)].." Eyes"
			local hair = hcolours[math.random(#hcolours)].." Hair"
				
			return height.." | "..weight.." | "..age.." | "..eyes.." | "..hair.." | Malnourished"
		end
		local desc = MakeDesc()

		Clockwork.player:Notify(player, "You have set "..target:Name().."'s desc to: "..desc);
		target:SetCharacterData("PhysDesc", Clockwork.kernel:ModifyPhysDesc(desc));
	else
		Clockwork.player:Notify(player, arguments[1].." is not a valid character!")
	end
end

COMMAND:Register()