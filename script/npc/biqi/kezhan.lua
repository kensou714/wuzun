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
您好,我是<font color="#FFFF00">仓库管理员</font>!
我将为您提供以下服务:
]]);
	npc:echo([[
<br><img src="images/x1.png" vspace='1' hspace='0' /><a href="event:local_depot">仓库服务</a> 
<br><img src="images/x1.png" vspace='1' hspace='0' /><a href="event:talk_jbfw1">金币服务</a> 
]]);
end



function onTalkjbfw1(npc,player)
	npc:echo([[我这还提供金币兑换的服务哦!
<br><img src="images/x1.png" vspace='1' hspace='0' />金币<a href="event:talk_jb">兑换金条 100万金币可以兑换1金条</a>
<br><img src="images/x1.png" vspace='1' hspace='0' />金条<a href="event:talk_jt">兑换金币 1金条可以兑换100万金币</a>
<br><img src="images/x1.png" vspace='1' hspace='0' />金条<a href="event:talk_jz1">兑换金砖 5个金条可以兑换1个金砖</a>
<br><img src="images/x1.png" vspace='1' hspace='0' />金砖<a href="event:talk_jz2">兑换金条 1个金砖可以兑换5个金条</a>
<br><img src="images/x1.png" vspace='1' hspace='0' />点击<a href="event:talk_100">返回上页</a>
]]);
end


function onTalkjz2(npc,player)
	if player:num_item("金砖",1) >= 1 then
		player:remove_item("金砖",1);
		player:add_item("金条",5);
		onTalkjbfw1(npc,player);
		player:alert(1,1,"成功兑换金条5根");
	else
		player:alert(1,1,"您的背包里没有金砖,无法兑换!");
		onTalkjbfw1(npc,player);
	end
end

function onTalkjz1(npc,player)
	if player:num_item("金条",1) >= 5 then
		player:remove_item("金条",5);
		player:add_item("金砖",1);
		onTalkjbfw1(npc,player);
		player:alert(1,1,"成功兑换金砖1块");
	else
		player:alert(1,1,"您的背包里金条不足5根,无法兑换!");
		onTalkjbfw1(npc,player);
	end
end


function onTalkjb(npc,player)
	if player:num_bag_black() >= 1 then
		if player:get_gamemoney() >= 1000000 then
			player:sub_gamemoney(1000000);
			player:add_item("金条",1);
			onTalkjbfw1(npc,player);
			player:alert(1,1,"成功兑换金条1根");
		else
			player:alert(1,1,"您的金币不足1000000,无法兑换!");
			onTalkjbfw1(npc,player);
		end
	else
		player:alert(1,1,"背包空格不足1格,无法兑换!");
		onTalkjbfw1(npc,player);
	end
end

function onTalkjt(npc,player)
	if player:num_item("金条",1) >= 1 then
		player:remove_item("金条",1);
		player:add_gamemoney(1000000);
		onTalkjbfw1(npc,player);
		player:alert(1,1,"成功兑换金币1000000");
	else
		player:alert(1,1,"您的背包里没有金条,无法兑换!");
		onTalkjbfw1(npc,player);
	end
end