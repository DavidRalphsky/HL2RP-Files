local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

function PLUGIN:Initialize()
	local Command = Clockwork.command:FindByID("Roll")
	-- Called when the command has been run.
	function Command:OnRun(player, arguments)
		if (arguments[1] != "potato") then
			local number = math.Clamp(tonumber(arguments[1]) or 100, 0, 1000000000);
			local roll = math.random(0, number);
			
			Clockwork.chatBox:AddInRadius(player, "roll", "has rolled "..roll.." out of "..number..".",
				player:GetPos(), Clockwork.config:Get("talk_radius"):Get()
			);
			Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().." has rolled "..roll.." out of "..number..".");
		else
			local roll = math.random(0, 100);
			
			Clockwork.chatBox:AddInRadius(player, "roll", "has rolled "..roll.." out of potato.",
				player:GetPos(), Clockwork.config:Get("talk_radius"):Get()
			);
			Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name().." has rolled "..roll.." out of potato.");
		end;
	end;
end;