module(..., package.seeall)
local task_id = 1106

function onGetTaskShortDesp(player)
	if player:get_task_state(1106) == 1 then
	player:echo([[<s='c'>[引导]</s>第一次加入行会
<a href="event:local_HelpGuild">点击此处打开行会面板</a>]]);
	return;
	end
end