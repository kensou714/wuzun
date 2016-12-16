module(..., package.seeall)
local task_id = 3100

function onGetTaskShortDesp(player)
	if player:get_task_state(3100) == 1 then
	player:echo([[<s='c'>[引导]</s>游戏帮助(<font color="#FF0000">成长</font>)
<a href="event:local_HelpGroupUp">点击此处查看游戏帮助</a>]]);
	return;
	end
end