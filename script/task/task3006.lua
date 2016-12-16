module(..., package.seeall)
local task_id = 3006

function onGetTaskShortDesp(player)
	if player:get_task_state(3006) == 1 and util.ppn(player,const.PP_GUANZHI) == 0 then
	player:echo([[<s='c'>[官职]</s>提升官职(<font color="#FF0000">九品</font>)
找]]..posnpc.mp("官职系统")..[[]]);
	return;
	end
	if player:get_task_state(3006) == 1 and util.ppn(player,const.PP_GUANZHI) == 1 then
	player:echo([[<s='c'>[官职]</s>提升官职(<font color="#FF0000">八品</font>)
找]]..posnpc.mp("官职系统")..[[]]);
	return;
	end
	if player:get_task_state(3006) == 1 and util.ppn(player,const.PP_GUANZHI) == 2 then
	player:echo([[<s='c'>[官职]</s>提升官职(<font color="#FF0000">七品</font>)
找]]..posnpc.mp("官职系统")..[[]]);
	return;
	end
end