local PLUGIN = PLUGIN;

local COMMAND = Clockwork.command:New("Scream");
COMMAND.tip = "Makes you scream.";

-- Called when the command has been run.
function COMMAND:OnRun(player)
	faction = player:GetFaction();
	if(faction == FACTION_STALKER) then	
		player:EmitSound("npc/stalker/go_alert2.wav", 60);			
	else
	Clockwork.player:Notify("You are not a Stalker!")
	end;
end;


COMMAND:Register();