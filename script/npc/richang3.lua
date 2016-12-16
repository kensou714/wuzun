module(..., package.seeall)
util.use_function(_M,task.task3004);

function onRefreshShowFlags(npc,player)
	local flags = 0;
	flags = flags + task.task3004.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	player:show_npc_flags(npc,flags);
end

function onTalk100(npc,player)
	task.task3004.check_richang_day(player);
	npc:echo([[

##continue## <s='tb'>你好,我是百花仙子!</s><l>]]);
	local s=player:get_task_state(3004);
	local d=math.fmod(s,const.TASK_STATE_NUM);
	local n = util.ppn(player,const.PP_RICHANG3_NUM)
	if const.RICHANG3_MAX_NUM > n or (d~=const.TSACCE and const.RICHANG3_MAX_NUM == n) then
		task.task3004.show_title(npc,player);
		task.task3004.show_fly(npc,player);
	else
		npc:echo("\n<font color='#ff0000'>您今天的百花争艳任务已全部完成!</font>\n");
	end
	npc:echo("<l>");
end

