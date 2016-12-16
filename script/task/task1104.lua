module(..., package.seeall)
local task_id = 1104

function onGetTaskShortDesp(player)
	if player:get_task_state(1104) == 1 then
	player:echo([[<s='c'>[引导]</s>完成一次坐骑提升
<a href="event:local_HelpMount">点击此处打开坐骑面板</a>]]);
	return;
	end
end