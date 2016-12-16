module(..., package.seeall)
require "task.task3010";
util.use_function(_M,task.task3010);

function open(player)
	task.task3010.check_yxtie_day(player);
	--if const.YXTIE_MAX_NUM > util.ppn(player,const.PP_YXTIE_NUM) then
		local s=player:get_task_state(3010);
		local d=math.fmod(s,const.TASK_STATE_NUM);
		if d == const.TSCOMP then
			player:echo("请先完成当前的英雄帖任务");
		end
		if d == const.TSACCE then
			task.task3010.set_task_level(player,3);
			task.task3010.show_title(player,player);
			item.item15026.show_merge(player);
		end
		if d == const.TSACED then
			task.task3010.show_fly(player,player);
		end
	--end
	return 0;
end
function show_merge(player)
	player:echo("\n<font color='#FFaa00'>请选择您想合成的英雄帖:\n</font><a href='event:talk_merge2'>中级英雄帖</a>:需要<font color='#FFff00'>初级英雄帖*5</font> [<font color='#FF0000'>2倍奖励</font>]\n");
	player:echo("<a href='event:talk_merge2'>高级英雄帖</a>:需要<font color='#FFff00'>中级英雄帖*5</font> [<font color='#FF0000'>4倍奖励</font>]\n");
	player:echo("<a href='event:talk_merge2'>超级英雄帖</a>:需要<font color='#FFff00'>高级英雄帖*5</font> [<font color='#FF0000'>8倍奖励</font>]\n<font color='#FFaa00'>请注意:合成需要缴纳[5万金币]的费用!</font>");
end
function onTalkmerge2(player)
	player:alert(1,1,"打开[熔炉]可以合成您所需要的英雄帖!");
	item.item15026.open(player);
end
