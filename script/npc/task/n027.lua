module(..., package.seeall)
util.use_function(_M,task.task1000);
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

##continue## <s='tb'>幸福就好,不要晒出来,因为晒多了,迟早有一天会晒干的。</s><l>]]);
end