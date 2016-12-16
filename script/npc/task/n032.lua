module(..., package.seeall)
util.use_function(_M,task.task1000);
util.use_function(_M,task.task3005);

function onRefreshShowFlags(npc,player)
	local flags = 0;
	flags = flags + task.task1000.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	player:show_npc_flags(npc,flags);
end
function onTalk100(npc,player)
	local task_state = task.task1000.get_npc_flags(npc,player);
	if task_state > 0 then
		task.task1000.show_task(npc,player);return;
	end
		npc:echo([[

##continue## <s='tb'>飞流直下三千尺,哪个宅男不废纸。安能摧眉折腰事权贵,今晚到底陪谁睡？</s><l>]]);
	task.task3005.show_title(npc,player);
end