module(..., package.seeall)

function touzi(player)
local i = math.random(1,6);
	player:set_temp_param(100,i)
	player:set_temp_param(101,1)
	player:play_effect(10,1101+i*10);
	player:set_timer(const.PT_SAIZI,3000);
end

function alee(player)
	if player:get_temp_param(100) then
		player:alert(1001,1,"掷出了"..(player:get_temp_param(100)).."点.");
	end
end
