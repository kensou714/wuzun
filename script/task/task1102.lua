module(..., package.seeall)
local task_id = 1102

function onGetTaskShortDesp(player)
	if player:get_task_state(1102) == 1 then
	player:echo([[<s='c'>[引导]</s>完成一次强化装备
<a href="event:local_HelUpgrade">点击此处打开装备强化面板</a>]]);
	return;
	end
end