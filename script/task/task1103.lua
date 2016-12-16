module(..., package.seeall)
local task_id = 1103

function onGetTaskShortDesp(player)
	if player:get_task_state(1103) == 1 then
	player:echo([[<s='c'>[引导]</s>完成一次心法修炼
<a href="event:local_HelpXinfa">点击此处打开心法面板</a>]]);
	return;
	end
end