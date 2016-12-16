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

##continue## <s='tb'>作为一岛之主,我不得不与这群木有节操,木有下限的人住在一起,真是悲哀啊!</s><l>]]);
	task.task3005.show_title(npc,player);
end