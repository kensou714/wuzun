module(..., package.seeall)
local task_id = 1101

function onGetTaskShortDesp(player)
	if player:get_task_state(1101) == 1 then
	player:echo([[<s='c'>[引导]</s>完成一次回收装备
<a href="event:local_HelpHuiShou">点击此处打开装备回收面板</a>]]);
	return;
	end
end