module(..., package.seeall)
util.use_function(_M,task.task1000);

function onRefreshShowFlags(npc,player)
	local flags = 0;
	flags = flags + task.task1000.get_npc_flags(npc,player);flags=task.util.fix_npc_flags(flags);
	player:show_npc_flags(npc,flags);
end

function onShop(npc,player)
	npc:echo([[请选择您要购买的武器:]]);
end

function onTalk100(npc,player)
	local task_state = task.task1000.get_npc_flags(npc,player);
	if task_state > 0 then
		task.task1000.show_task(npc,player);return;
	end
	npc:echo([[
您好,我是<font color="#FFFF00">铁匠铺老板</font>!
我将为您提供以下服务:
]]);
	npc:echo([[

<p>##shop##<a href="event:local_shop_1">购买武器</a></p>
<p>##shop##<a href="event:local_shop_11">购买武器(绑定金币)</a></p>
<p>##shop##<a href="event:talk_yjcs">出售物品</a></p>
<p>##shop##<a href="event:local_repair">特殊修理</a></p>
	]]);
end



function onTalkyjcs(npc,player)
	ckpanel.open_yjchushou(player);
	onTalk100(npc,player);
end