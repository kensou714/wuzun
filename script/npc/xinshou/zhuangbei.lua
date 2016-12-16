module(..., package.seeall)

function onRefreshShowFlags(npc,player)
end

function onShop(npc,player)
	npc:echo([[请选择您要购买的装备:]]);
end

function onTalk100(npc,player)
	local task_state = task.task1000.get_npc_flags(npc,player);
	if task_state > 0 then
		task.task1000.show_task(npc,player);return;
	end
	npc:echo([[
您好,我是<font color="#FFFF00">装备店老板</font>!
我将为您提供以下服务:
]]);
	npc:echo([[

<p>##shop##<a href="event:local_shop">购买装备</a></p> 
<p>##shop##<a href="event:local_shop_10">购买装备(绑定金币)</a></p>
<p>##shop##<a href="event:talk_yjcs">出售物品</a></p>
<p>##shop##<a href="event:local_repair">特殊修理</a></p>
]]);
end


function onTalkyjcs(npc,player)
	ckpanel.open_yjchushou(player);
	onTalk100(npc,player);
end