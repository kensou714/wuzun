module(..., package.seeall)


function onShop(npc,player)
	if player:get_team_name() == "魔族阵营" then
	npc:echo([[请选择您要购买的药品:]]);
	else
	npc:echo([[你好像不是魔族阵营的!]]);
	end
end

function onTalk100(npc,player)
	if player:get_team_name() == "魔族阵营" then
	npc:echo([[
您好,我是<font color="#FFFF00">药店老板</font>!
我将为您提供以下服务:
]]);
	npc:echo([[

<p>##shop##<a href="event:local_shop">购买药品</a></p>
<p>##shop##<a href="event:local_shop_10">购买药品(绑定金币)</a></p>
<p>##shop##<a href="event:talk_yjcs">出售物品</a></p>
]]);
	else
	npc:echo([[
您好,我是<font color="#FFFF00">魔族药店老板</font>!

我只为魔族阵营的勇士提供服务!!
]]);
	end
end


function onTalkyjcs(npc,player)
	ckpanel.open_yjchushou(player);
	onTalk100(npc,player);
end

