module(..., package.seeall)
util.use_function(_M,task.task3005);
util.use_function(_M,task.task1000);
function onRefreshShowFlags(npc,player)
	local flags = 0;
	flags = flags + task.task3005.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	flags = flags + task.task1000.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	player:show_npc_flags(npc,flags);
end
function onTalk100(npc,player)
	local task_state = task.task1000.get_npc_flags(npc,player);
	if task_state > 0 then
		task.task1000.show_task(npc,player);return;
	end
	task.task3005.check_yabiao_day(player);
	if player:get_dart_task_flag() == 1 then
		npc:echo("请先将现在这趟镖走完再来接镖");
		return;
	end
	npc:echo([[我乃镇远镖局夏欣总镖头,由于世道混乱,镖局生意大好!现在镖局人手严重短缺,有以下几种镖车需要押运!你可以帮帮我吗?<br><br>]]);
		npc:echo([[请选择你要押运的镖车:<br><br>	 <a href='event:talk_ya1'>青铜镖车</a> (<s='r'>经验]]..task.task3005.get_exp(player,2)..[[</s>)<br><br>]]);
		npc:echo([[	 <a href='event:talk_ya2'>黄金镖车</a> (<s='r'>经验]]..task.task3005.get_exp(player,3)..[[</s>)<br><br>]]);
		npc:echo([[	 <a href='event:talk_ya3'>蓝玉镖车</a> (<s='r'>经验]]..task.task3005.get_exp(player,4)..[[</s>)<br><br>]]);
		npc:echo([[	 <a href='event:talk_ya4'>紫金镖车</a> (<s='r'>经验]]..task.task3005.get_exp(player,5)..[[</s>)<br><br>]]);
		npc:echo([[劫取镖车: <font color='#FFff00'>可以获得镖车[<s='r'>40%</s>]的经验</font><br><br>劫镖次数: <font color='#FFff00'>你今天还可劫镖[<s='r'>]]..math.max(0,const.JIEBIAO_MAX_NUM-util.ppn(player,const.PP_JIEBIAO))..[[</s>]次</font></s><br><br>]]);
	show_merge(npc,player);
end
function ya(npc,player,id)
	if player:get_level() >= 45 then
		if util.ppn(player,const.PP_YABIAO_NUM) < const.YABIAO_MAX_NUM then
			player:set_param(const.PP_YABIAO_TYPE,id);
			player:set_task_state(3005,task.util.ts(id,const.TSACCE));
			player:push_task_data(3005,0);
			task.task3005.onTalkT3005Show(npc,player);
		else
			player:alert(1,1,[[<font color="#ff0000" size="12px">您今日的押镖次数已经用完,无法继续押镖!</font>]]);
			return 100;
		end
	else
		player:alert(1,1,[[<font color="#ff0000" size="12px">押镖镖车需要等级达到45级!</font>]]);
		return 100;
	end
end
function onTalkya1(npc,player)
	return ya(npc,player,2);
end
function onTalkya2(npc,player)
	return ya(npc,player,3);
end
function onTalkya3(npc,player)
	return ya(npc,player,4);
end
function onTalkya4(npc,player)
	return ya(npc,player,5);
end
function show_merge(npc,player)
	npc:echo("<font color='#FFaa00'>请选择您想合成的押镖令牌:</font>\n     <a href='event:talk_merge2'>黄金镖令</a>: 需要<font color='#FFff00'>5块青铜镖令</font> [<font color='#FF0000'>2倍</font>]\n     <a href='event:talk_merge2'>蓝玉镖令</a>: 需要<font color='#FFff00'>5块黄金镖令</font> [<font color='#FF0000'>4倍</font>]\n     <a href='event:talk_merge2'>紫金镖令</a>: 需要<font color='#FFff00'>5块蓝玉镖令</font> [<font color='#FF0000'>8倍</font>]\n<font color='#FFaa00'>请注意:合成需要缴纳[5万金币]的费用!</font>\n");
end
function onTalkmerge2(npc,player)
	player:alert(1,1,"打开[熔炉]可以合成您所需要的押镖令!");
	onTalk100(npc,player);
end