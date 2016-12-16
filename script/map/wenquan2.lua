module(..., package.seeall)


function onPlayerEnter(map,player)
	player:clear_slave();
	player:clear_mofadun();
	--go.rand(player);
end
function onPlayerLeave(map,player)
	local s = player:get_task_state(1000);
	local b = math.floor(s / const.TASK_STATE_NUM);
	local d = math.fmod(s,const.TASK_STATE_NUM);
	if b == 81 and d == const.TSACED then
		player:set_task_state(1000,task.util.ts(81,const.TSCOMP));
		player:push_task_data(1000,0);
	end
end
