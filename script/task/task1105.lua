module(..., package.seeall)
local task_id = 1105

function onGetTaskShortDesp(player)
	if player:get_task_state(1105) == 1 then
	player:echo([[<s='c'>[引导]</s>完成一次神器进阶
<a href="event:local_HelpShenqi">点击此处打开神器面板</a>]]);
	return;
	end
end